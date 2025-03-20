import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/quiz/presentation/blocs/quiz_bloc.dart';
import 'package:todo/features/quiz/presentation/pages/score.dart';
import 'package:todo/features/quiz/presentation/widgets/movie_player_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class QuestionsScreen extends StatelessWidget {
  static const routeName = '/quiz';
  const QuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Questions'),
      ),
      body: BlocListener<QuizBloc, QuizState>(
          listener: (context, state) {
            if (state is QuizFinished) {
              Navigator.pushNamed(
                  context,
                  ScoreScreen.routeName,
              );
            }
          },
          child: BlocBuilder<QuizBloc, QuizState>(
            builder: (context, state) {
              if (state is QuizLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is QuizLoaded) {
                final minutes = state.elapsedTime.inMinutes;
                final seconds = state.elapsedTime.inSeconds.remainder(60);

                final question = state.questions.firstWhere((q) => q.id == state.currentQuestionId);
                return Column(
                    children: [
                      Text(
                        'Temps : $minutes:${seconds.toString().padLeft(2, '0')}',
                      ),
                      if (question.videoURL != null) MoviePlayerWidget(url: question.videoURL!),
                      ListTile(
                        title: Text(question.label),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: question.options.map((option) {
                            return RadioListTile<int>(
                              title: Text(option.label),
                              value: option.id,
                              groupValue: state.selectedAnswerId,
                              selected: state.selectedAnswerId == option.id,
                              onChanged: (id) {
                                context.read<QuizBloc>().add(SelectAnswerEvent(state.currentQuestionId!, id!));
                              },
                            );
                          }).toList(),
                        ),
                      )
                    ]
                );
              } else if (state is QuizError) {
                return Center(child: Text('Error: ${state.message}'));
              } else {
                return const Center(child: Text('Hum, la on est dans le else :/.'));
              }
            },
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final state = context.read<QuizBloc>().state;
          if (state is QuizLoaded && state.selectedAnswerId != null) {
            context.read<QuizBloc>().add(AnswerQuestionEvent(state.currentQuestionId!, state.selectedAnswerId!));
          }
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}