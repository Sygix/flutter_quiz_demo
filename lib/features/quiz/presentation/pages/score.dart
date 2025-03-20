import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/quiz_bloc.dart';

class ScoreScreen extends StatelessWidget {
  static const routeName = '/score';
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        if (state is QuizFinished) {
          final scorePercentage = ((state.score / state.totalQuestions) * 100).toStringAsFixed(1);
          final minutes = state.totalTime.inMinutes;
          final seconds = state.totalTime.inSeconds.remainder(60);

          return Scaffold(
            appBar: AppBar(title: const Text('Résultat')),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Bravo, vous venez d\'obtenir $scorePercentage%', style: Theme.of(context).textTheme.titleMedium), // to round the percentage, you can use the .toStringAsFixed(2) method
                  Text('Score final : ${state.score}/${state.totalQuestions}', style: Theme.of(context).textTheme.headlineLarge),
                  const SizedBox(height: 20),
                  Text('Temps total : $minutes:${seconds.toString().padLeft(2, '0')}', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.read<QuizBloc>().add(ResetQuizEvent());
                      Navigator.popUntil(context, ModalRoute.withName('/'));
                    },
                    child: const Text('Recommencer'),
                  )
                ],
              ),
            ),
          );
        }
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
