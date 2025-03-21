import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/entities/quiz_source.dart';
import '../blocs/quiz_bloc.dart';

class QuizOptionCard extends StatelessWidget {
  final String title;
  final QuizSource source;
  final bool shuffledOptions;
  final bool movingOptions;

  const QuizOptionCard({super.key, required this.title, required this.source, this.shuffledOptions = false, this.movingOptions = false});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        context.read<QuizBloc>().add(LoadQuizEvent(source: source, shuffledOptions: shuffledOptions, movingOptions: movingOptions));
        Navigator.pushNamed(context, '/quiz');
      },
    );
  }
}