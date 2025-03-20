import 'package:todo/features/quiz/domain/entities/question.dart';

import '../../data/entities/quiz_source.dart';
import '../../data/repositories/quiz_repository.dart';

class GetQuestionsUseCase {
  final QuizRepository repository;

  GetQuestionsUseCase(this.repository);

  Future<List<Question>> execute(QuizSource source) async {
    try {
      return await repository.getQuestions(source);
    } catch (e) {
      throw Exception(e);
    }
  }
}