import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/entities/quiz_source.dart';
import '../blocs/quiz_bloc.dart';

class QuizOptionCard extends StatelessWidget {
  final String title;
  final QuizSource source;

  const QuizOptionCard({super.key, required this.title, required this.source});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        context.read<QuizBloc>().add(LoadQuizEvent(source));
        Navigator.pushNamed(context, '/quiz');
      },
    );
  }
}