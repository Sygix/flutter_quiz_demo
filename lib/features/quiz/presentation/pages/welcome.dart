import 'package:flutter/material.dart';
import 'package:todo/features/quiz/presentation/pages/history.dart';

import '../../data/entities/quiz_source.dart';
import '../widgets/quiz_option_card_widget.dart';

class WelcomePage extends StatefulWidget {
  static const routeName = '/';
  const WelcomePage({super.key});

  @override
  WelcomePageState createState() => WelcomePageState();
}

class WelcomePageState extends State<WelcomePage> {
  bool _shuffleOptions = false;
  bool _movingOptions = false;

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
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            QuizOptionCard(
              title: 'Quiz de démo',
              source: QuizSource.mock,
              shuffledOptions: _shuffleOptions,
              movingOptions: _movingOptions,
            ),
            QuizOptionCard(
              title: 'Quiz GitHub',
              source: QuizSource.remote,
              shuffledOptions: _shuffleOptions,
              movingOptions: _movingOptions,
            ),
            QuizOptionCard(
              title: 'Quiz de films',
              source: QuizSource.movie,
              shuffledOptions: _shuffleOptions,
              movingOptions: _movingOptions,
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              title: const Text('Shuffle Options'),
              value: _shuffleOptions,
              onChanged: (bool value) {
                setState(() {
                  _shuffleOptions = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Moving Options'),
              value: _movingOptions,
              onChanged: (bool value) {
                setState(() {
                  _movingOptions = value;
                });
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, HistoryScreen.routeName),
              child: const Text("Voir l'historique"),
            )
          ],
        ),
      ),
    );
  }
}