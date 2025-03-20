import 'package:get_it/get_it.dart';
import 'package:todo/features/quiz/data/datasource/quiz_datasource.dart';
import 'package:todo/features/quiz/data/datasource/quiz_mock_datasource.dart';
import 'package:todo/features/quiz/data/repositories/quiz_repository.dart';
import 'package:http/http.dart' as http;

import '../features/quiz/data/datasource/quiz_movie_datasource.dart';
import '../features/quiz/data/datasource/quiz_remote_datasource.dart';
import '../features/quiz/data/repositories/quiz_repository_impl.dart';
import '../features/quiz/domain/usecases/get_questions.dart';
import '../features/quiz/presentation/blocs/quiz_bloc.dart';

final locator = GetIt.instance;

void setupLocator() {
  // Data source
  locator.registerLazySingleton<QuizDataSource>(() => QuizMockDatasource());
  locator.registerLazySingleton<QuizRemoteDataSource>(() => QuizRemoteDataSource(http.Client()));
  locator.registerLazySingleton<QuizMovieDatasource>(() => QuizMovieDatasource());

  // Repositories
  locator.registerLazySingleton<QuizRepository>(() => QuizRepositoryImpl(
    mockDataSource: locator(),
    remoteDataSource: locator(),
    movieDataSource: locator(),
  ));

  // Use cases
  locator.registerLazySingleton<GetQuestionsUseCase>(() => GetQuestionsUseCase(locator()));

  // Blocs
  locator.registerFactory<QuizBloc>(() => QuizBloc(locator()));
}
