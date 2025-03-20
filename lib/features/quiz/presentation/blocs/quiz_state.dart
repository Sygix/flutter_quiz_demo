part of 'quiz_bloc.dart';

@immutable
sealed class QuizState {}

final class QuizInitial extends QuizState {}
final class QuizLoading extends QuizState {}
final class QuizLoaded extends QuizState {
  final List<Question> questions;
  final int score;
  final int? currentQuestionId;
  final int? selectedAnswerId;
  final Duration elapsedTime;
  QuizLoaded({required this.questions, this.score = 0, required this.currentQuestionId, this.selectedAnswerId, required this.elapsedTime});
  QuizLoaded copyWith({
    Duration? elapsedTime,
  }) {
    return QuizLoaded(
      questions: questions,
      score: score,
      currentQuestionId: currentQuestionId,
      selectedAnswerId: selectedAnswerId,
      elapsedTime: elapsedTime ?? this.elapsedTime,
    );
  }
}
final class QuizError extends QuizState {
  final String message;
  QuizError({required this.message});
}
final class QuizFinished extends QuizState {
  final int score;
  final int totalQuestions;
  final Duration totalTime;
  QuizFinished({required this.score, required this.totalQuestions, required this.totalTime});
}