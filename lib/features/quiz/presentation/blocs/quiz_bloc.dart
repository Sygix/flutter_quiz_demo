import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo/features/quiz/data/entities/quiz_source.dart';
import 'package:todo/features/quiz/data/helper/database_helper.dart';
import 'package:todo/features/quiz/domain/entities/question.dart';
import 'package:todo/features/quiz/domain/usecases/get_questions.dart';

import '../../data/models/score_history_model.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  DateTime? _startTime;
  Timer? _timer;
  final GetQuestionsUseCase getQuestions;


  void _startTimer({required bool movingOptions}) {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      add(TimerTickEvent(movingOptions: movingOptions));
    });
  }

  void _resetTimer() {
    _timer?.cancel();
    _startTime = null;
  }

  QuizBloc(this.getQuestions) : super(QuizInitial()) {
    on<LoadQuizEvent>((event, emit) async {
      emit(QuizLoading());
      try {
        final questions = await getQuestions.execute(event.source);
        if(event.shuffledOptions) {
          for (var q in questions) {
            q.options.shuffle();
          }
        }
        _startTime = DateTime.now();
        emit(QuizLoaded(questions: questions, currentQuestionId: questions.first.id, elapsedTime: Duration.zero));
        _startTimer(movingOptions: event.movingOptions);
      } catch (e) {
        emit(QuizError(message: e.toString()));
      }
    });

    on<SelectAnswerEvent>((event, emit) {
      if(state is QuizLoaded) {
        final currentState = state as QuizLoaded;
        final elapsedTime = DateTime.now().difference(_startTime!);
        emit(QuizLoaded(
          questions: currentState.questions,
          score: currentState.score,
          currentQuestionId: event.questionId,
          selectedAnswerId: event.answerId,
          elapsedTime: elapsedTime,
        ));
      }
    });

    on<AnswerQuestionEvent>((event, emit) async {
      if (state is QuizLoaded) {
        final currentState = state as QuizLoaded;
        final currentQuestion = currentState.questions.firstWhere((q) => q.id == event.questionId);
        final isCorrect = currentQuestion.correctAnswerId == event.answerId;
        final newScore = isCorrect ? currentState.score + 1 : currentState.score;
        final isLastQuestion = currentState.questions.last.id == event.questionId;

        if (isLastQuestion) {
          final totalTime = DateTime.now().difference(_startTime!);
          final historyEntry = ScoreHistory(
            id: 0,
            score: newScore,
            totalQuestions: currentState.questions.length,
            totalTime: totalTime,
            date: DateTime.now(),
          );
          await DatabaseHelper().addScore(historyEntry);
          emit(QuizFinished(score: newScore, totalQuestions: currentState.questions.length, totalTime: totalTime));
          _resetTimer();
        } else {
          final nextQuestionId = currentState.questions[
            currentState.questions.indexWhere((q) => q.id == event.questionId) + 1
          ].id;
          const newSelectedAnswerId = null;
          final elapsedTime = DateTime.now().difference(_startTime!);
          emit(QuizLoaded(questions: currentState.questions, score: newScore, currentQuestionId: nextQuestionId, selectedAnswerId: newSelectedAnswerId, elapsedTime: elapsedTime));
        }
        print('Answered question is corrent ? $isCorrect');
        print('New score: $newScore');
      }
    });

    on<ResetQuizEvent>((event, emit) {
      _resetTimer();
      emit(QuizInitial());
    });

    on<TimerTickEvent>((event, emit) {
      if (state is QuizLoaded && _startTime != null) {
        final elapsedTime = DateTime.now().difference(_startTime!);
        final currentState = state as QuizLoaded;
        if(event.movingOptions) {
          final currentQuestion = currentState.questions.firstWhere((q) => q.id == currentState.currentQuestionId);
          currentQuestion.options.shuffle();
        }
        emit(currentState.copyWith(elapsedTime: elapsedTime));
      }
    });
  }
}
