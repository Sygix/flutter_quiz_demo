import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/dependency_injection.dart';
import 'package:todo/features/quiz/presentation/blocs/quiz_bloc.dart';
import 'package:todo/features/quiz/presentation/pages/questions.dart';
import 'package:todo/features/quiz/presentation/pages/score.dart';
import 'package:todo/features/quiz/presentation/pages/welcome.dart';

import 'features/quiz/presentation/pages/history.dart';

void main() {
  setupLocator();
  runApp(
    BlocProvider(
      create: (_) => locator<QuizBloc>(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Quiz',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: WelcomePage.routeName,
      routes: {
        WelcomePage.routeName: (context) => const WelcomePage(),
        QuestionsScreen.routeName: (context) => const QuestionsScreen(),
        ScoreScreen.routeName: (context) => BlocProvider.value(
          value: context.read<QuizBloc>(),
          child: const ScoreScreen(),
        ),
        HistoryScreen.routeName: (context) => const HistoryScreen(),
      },
    );
  }
}