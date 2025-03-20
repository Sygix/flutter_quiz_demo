import 'package:todo/features/quiz/data/models/answer_model.dart';
import 'package:todo/features/quiz/domain/entities/question.dart';

class QuestionModel {
  final int id;
  final String label;
  final int correctAnswerId;
  final List<AnswerModel> options;
  final String? videoURL;

  QuestionModel({
    required this.id,
    required this.label,
    required this.correctAnswerId,
    required this.options,
    this.videoURL,
  });

  Question toEntity() => Question(
      id: id,
      label: label,
      correctAnswerId: correctAnswerId,
      options: options.map((option) => option.toEntity()).toList(),
      videoURL: videoURL
  );

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'],
      label: json['label'],
      correctAnswerId: json['correct_answer_id'],
      options: (json['answers'] as List)
          .map((e) => AnswerModel.fromJson(e)) // Parsing correct
          .toList(),
    );
  }
}