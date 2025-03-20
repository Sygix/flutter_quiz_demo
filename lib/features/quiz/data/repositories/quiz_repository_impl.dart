import 'package:todo/features/quiz/data/datasource/quiz_datasource.dart';
import 'package:todo/features/quiz/data/datasource/quiz_movie_datasource.dart';
import 'package:todo/features/quiz/data/repositories/quiz_repository.dart';
import 'package:todo/features/quiz/domain/entities/question.dart';

import '../datasource/quiz_remote_datasource.dart';
import '../entities/quiz_source.dart';

class QuizRepositoryImpl implements QuizRepository {
  final QuizDataSource mockDataSource;
  final QuizRemoteDataSource remoteDataSource;
  final QuizMovieDatasource movieDataSource;

  QuizRepositoryImpl({
    required this.mockDataSource,
    required this.remoteDataSource,
    required this.movieDataSource,
  });

  @override
  Future<List<Question>> getQuestions(QuizSource source) async {
    switch(source) {
      case QuizSource.mock:
        return mockDataSource.fetchQuestions().then((value) => value.map((e) => e.toEntity()).toList());
      case QuizSource.remote:
        return remoteDataSource.fetchQuestions().then((value) => value.map((e) => e.toEntity()).toList());
      case QuizSource.movie:
        return movieDataSource.fetchQuestions().then((value) => value.map((e) => e.toEntity()).toList());
    }
  }
}