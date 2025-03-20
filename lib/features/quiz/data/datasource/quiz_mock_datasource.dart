import 'package:todo/features/quiz/data/datasource/quiz_datasource.dart';
import 'package:todo/features/quiz/data/models/answer_model.dart';

import '../models/question_model.dart';

class QuizMockDatasource implements QuizDataSource {
  @override
  Future<List<QuestionModel>> fetchQuestions() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      QuestionModel(
        id: 1,
        label: 'What is the capital of France?',
        correctAnswerId: 0,
        options: [
          AnswerModel(id: 0, label: "Paris"),
          AnswerModel(id: 1, label: "Lyon"),
          AnswerModel(id: 2, label: "Marseille"),
          AnswerModel(id: 3, label: "Toulouse"),
        ],
      ),
      QuestionModel(
        id: 2,
        label: 'What is the capital of Spain?',
        correctAnswerId: 0,
        options: [
          AnswerModel(id: 0, label: "Madrid"),
          AnswerModel(id: 1, label: "Barcelona"),
          AnswerModel(id: 2, label: "Valencia"),
          AnswerModel(id: 3, label: "Seville"),
        ],
      ),
      QuestionModel(
        id: 3,
        label: 'What is the capital of Italy?',
        correctAnswerId: 1,
        options: [
          AnswerModel(id: 0, label: "Milan"),
          AnswerModel(id: 1, label: "Rome"),
          AnswerModel(id: 2, label: "Naples"),
          AnswerModel(id: 3, label: "Turin"),
        ],
      ),
    ];
  }
}