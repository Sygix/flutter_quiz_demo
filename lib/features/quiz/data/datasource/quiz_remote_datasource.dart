import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/question_model.dart';

class QuizRemoteDataSource {
  final http.Client client;

  QuizRemoteDataSource(this.client);

  Future<List<QuestionModel>> fetchQuestions() async {
    final response = await client.get(Uri.parse(
        'https://raw.githubusercontent.com/worldline/learning-kotlin-multiplatform/main/quiz.json'
    ));

    if(response.statusCode == 200) {
      final List<dynamic> questions = jsonDecode(response.body)['questions'];
      return questions
          .map<QuestionModel>((e) => QuestionModel.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load quiz');
    }
  }
}