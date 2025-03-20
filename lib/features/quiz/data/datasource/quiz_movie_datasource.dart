import 'package:todo/features/quiz/data/datasource/quiz_datasource.dart';
import 'package:todo/features/quiz/data/models/answer_model.dart';

import '../models/question_model.dart';

class QuizMovieDatasource implements QuizDataSource {
  @override
  Future<List<QuestionModel>> fetchQuestions() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      QuestionModel(
        id: 1,
        label: 'Quel film contient cette scène culte ?',
        correctAnswerId: 0,
        options: [
          AnswerModel(id: 0, label: "Inception"),
          AnswerModel(id: 1, label: "Interstellar"),
          AnswerModel(id: 2, label: "Intouchables"),
          AnswerModel(id: 3, label: "The Dark Knight"),
        ],
        videoURL: "https://youtu.be/YoHD9XEInc0"
      ),
    ];
  }
}