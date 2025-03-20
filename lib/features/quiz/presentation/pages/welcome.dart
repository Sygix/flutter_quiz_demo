import 'package:flutter/material.dart';

import '../../data/entities/quiz_source.dart';
import '../widgets/quiz_option_card_widget.dart';

class WelcomePage extends StatelessWidget {
  static const routeName = '/';
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Quiz",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Une app de quiz "simple" pour découvrir Flutter',
              style: Theme.of(context).textTheme.titleMedium
            ),
            const SizedBox(height: 8),
            const QuizOptionCard(
              title: 'Quiz de démo',
              source: QuizSource.mock,
            ),
            const QuizOptionCard(
              title: 'Quiz GitHub',
              source: QuizSource.remote,
            ),
            const QuizOptionCard(
              title: 'Quiz de films',
              source: QuizSource.movie,
            ),
          ],
        ),
      ),
    );
  }
}