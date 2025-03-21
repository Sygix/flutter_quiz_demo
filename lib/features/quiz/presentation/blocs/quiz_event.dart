part of 'quiz_bloc.dart';

@immutable
sealed class QuizEvent {}

class LoadQuizEvent extends QuizEvent {
  final QuizSource source;
  final bool shuffledOptions;
  final bool movingOptions;
  LoadQuizEvent({required this.source, this.shuffledOptions = false, this.movingOptions = false});
}
class SelectAnswerEvent extends QuizEvent {
  final int questionId;
  final int answerId;
  SelectAnswerEvent(this.questionId, this.answerId);
}
class AnswerQuestionEvent extends QuizEvent {
  final int questionId;
  final int answerId;
  AnswerQuestionEvent(this.questionId, this.answerId);
}
class ResetQuizEvent extends QuizEvent {}
class TimerTickEvent extends QuizEvent {
  final bool movingOptions;
  TimerTickEvent({required this.movingOptions});
}