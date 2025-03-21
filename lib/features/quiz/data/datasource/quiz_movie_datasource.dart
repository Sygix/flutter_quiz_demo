import 'package:todo/features/quiz/data/datasource/quiz_datasource.dart';
import 'package:todo/features/quiz/data/models/answer_model.dart';

import '../models/question_model.dart';

class QuizMovieDatasource implements QuizDataSource {
  @override
  Future<List<QuestionModel>> fetchQuestions() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      QuestionModel(
        id: 1,
        label: 'De quel film Fast and Furious vient cette scène culte ?',
        correctAnswerId: 2,
        options: [
          AnswerModel(id: 0, label: "Fast Five"),
          AnswerModel(id: 1, label: "The Fast and the Furious"),
          AnswerModel(id: 2, label: "Furious 7"),
          AnswerModel(id: 3, label: "Too Fast Too Furious"),
        ],
        videoURL: "https://www.youtube.com/watch?v=7cPMriE8fKU"
      ),
      QuestionModel(
          id: 2,
          label: 'De quel film Fast and Furious vient cette scène culte ?',
          correctAnswerId: 1,
          options: [
            AnswerModel(id: 0, label: "Fast Five"),
            AnswerModel(id: 1, label: "Fast and Furious 9"),
            AnswerModel(id: 2, label: "Furious 7"),
            AnswerModel(id: 3, label: "Too Fast Too Furious"),
          ],
          videoURL: "https://www.youtube.com/watch?v=proTVrB2y_I"
      ),
      QuestionModel(
          id: 3,
          label: 'De quel film Fast and Furious vient cette scène culte ?',
          correctAnswerId: 3,
          options: [
            AnswerModel(id: 0, label: "Too Fast Too Furious"),
            AnswerModel(id: 1, label: "Fast and Furious 9"),
            AnswerModel(id: 2, label: "Fast and Furious 6"),
            AnswerModel(id: 3, label: "Fast and Furious: Tokyo Drift"),
          ],
          videoURL: "https://www.youtube.com/watch?v=ubMXBEj6d7w"
      ),
      QuestionModel(
          id: 4,
          label: 'De quel film Iron Man vient cette scène culte ?',
          correctAnswerId: 2,
          options: [
            AnswerModel(id: 0, label: "Iron Man 2"),
            AnswerModel(id: 1, label: "Iron Man 3"),
            AnswerModel(id: 2, label: "Iron Man"),
          ],
          videoURL: "https://www.youtube.com/watch?v=DK7hVtPD1JQ"
      ),
      QuestionModel(
          id: 5,
          label: 'De quel film Iron Man vient cette scène culte ?',
          correctAnswerId: 1,
          options: [
            AnswerModel(id: 0, label: "Iron Man"),
            AnswerModel(id: 1, label: "Iron Man 3"),
            AnswerModel(id: 2, label: "Iron Man 2"),
          ],
          videoURL: "https://www.youtube.com/watch?v=DlM5n77tGHM"
      ),
      QuestionModel(
          id: 6,
          label: 'De quel film Iron Man vient cette scène culte ?',
          correctAnswerId: 0,
          options: [
            AnswerModel(id: 0, label: "Iron Man 2"),
            AnswerModel(id: 1, label: "Iron Man 3"),
            AnswerModel(id: 2, label: "Iron Man"),
          ],
          videoURL: "https://www.youtube.com/watch?v=WD5FvyXdc7E"
      ),
      QuestionModel(
          id: 7,
          label: 'De quel film Avengers vient cette scène culte ?',
          correctAnswerId: 1,
          options: [
            AnswerModel(id: 0, label: "Age of Ultron"),
            AnswerModel(id: 1, label: "Infinity War"),
            AnswerModel(id: 2, label: "Endgame"),
            AnswerModel(id: 3, label: "The Avengers"),
            AnswerModel(id: 4, label: "Doomsday"),
            AnswerModel(id: 5, label: "Secret Wars"),
          ],
          videoURL: "https://www.youtube.com/watch?v=ekxJff-lRFU"
      ),
    ];
  }
}