class ScoreHistory {
  int? id;
  final int score;
  final int totalQuestions;
  final Duration totalTime;
  final DateTime date;

  ScoreHistory({
    this.id,
    required this.score,
    required this.totalQuestions,
    required this.totalTime,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'score': score,
      'total_questions': totalQuestions,
      'total_time': totalTime.inSeconds,
      'date': date.toIso8601String(),
    };
  }

  factory ScoreHistory.fromMap(Map<String, dynamic> map) {
    return ScoreHistory(
      id: map['id'],
      score: map['score'],
      totalQuestions: map['total_questions'],
      totalTime: Duration(seconds: map['total_time']),
      date: DateTime.parse(map['date']),
    );
  }
}