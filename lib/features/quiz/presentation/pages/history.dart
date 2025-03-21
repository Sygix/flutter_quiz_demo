import 'package:flutter/material.dart';

import '../../data/helper/database_helper.dart';
import '../../data/models/score_history_model.dart';

class HistoryScreen extends StatefulWidget {
  static const routeName = '/history';

  const HistoryScreen({super.key});

  @override
  HistoryScreenState createState() => HistoryScreenState();
}

class HistoryScreenState extends State<HistoryScreen> {
  late Future<List<ScoreHistory>> _history;

  @override
  void initState() {
    super.initState();
    _history = DatabaseHelper().getHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Historique des scores')),
      body: FutureBuilder<List<ScoreHistory>>(
        future: _history,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur : ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Aucun historique'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final entry = snapshot.data![index];
                return ListTile(
                  title: Text('${entry.score}/${entry.totalQuestions}'),
                  subtitle: Text(
                    '${entry.date.day}/${entry.date.month}/${entry.date.year} '
                        '${entry.totalTime.inMinutes}:${entry.totalTime.inSeconds.remainder(60)}',
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}