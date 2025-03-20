import 'package:todo/features/quiz/domain/entities/answer.dart';

class Question {
  final int id;
  final String label;
  final int correctAnswerId;
  final List<Answer> options;
  final String? videoURL;

  const Question({
    required this.id,
    required this.label,
    required this.correctAnswerId,
    required this.options,
    this.videoURL,
  });
}