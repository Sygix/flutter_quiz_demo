import 'package:todo/features/quiz/domain/entities/answer.dart';
import 'package:todo/features/quiz/domain/entities/question.dart';

class AnswerModel {
  final int id;
  final String label;

  AnswerModel({
    required this.id,
    required this.label,
  });

  Answer toEntity() => Answer(
      id: id,
      label: label,
  );

  factory AnswerModel.fromJson(Map<String, dynamic> json) {
    return AnswerModel(
      id: json['id'],
      label: json['label'],
    );
  }
}