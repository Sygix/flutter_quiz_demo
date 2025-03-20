import '../../domain/entities/question.dart';
import '../entities/quiz_source.dart';

abstract class QuizRepository {
  Future<List<Question>> getQuestions(QuizSource source);
}