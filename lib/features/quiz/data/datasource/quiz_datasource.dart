import 'package:todo/features/quiz/data/models/question_model.dart';

abstract class QuizDataSource {
  Future<List<QuestionModel>> fetchQuestions();
}