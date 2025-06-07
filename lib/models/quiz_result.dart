// lib/models/quiz_result.dart

/// Model class representing the result of a language learning quiz
/// Used in our Talkalingo application to track user performance
class QuizResult {
  final int correctAnswers;
  final int totalQuestions;
  final double score;
  final String grade;
  final bool passed;
  
  const QuizResult({
    required this.correctAnswers,
    required this.totalQuestions,
    required this.score,
    required this.grade,
    required this.passed,
  });
  
  /// Creates a copy of this QuizResult with optionally updated values
  QuizResult copyWith({
    int? correctAnswers,
    int? totalQuestions,
    double? score,
    String? grade,
    bool? passed,
  }) {
    return QuizResult(
      correctAnswers: correctAnswers ?? this.correctAnswers,
      totalQuestions: totalQuestions ?? this.totalQuestions,
      score: score ?? this.score,
      grade: grade ?? this.grade,
      passed: passed ?? this.passed,
    );
  }
  
  @override
  String toString() {
    return 'QuizResult(correctAnswers: $correctAnswers, totalQuestions: $totalQuestions, score: $score, grade: $grade, passed: $passed)';
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    
    return other is QuizResult &&
      other.correctAnswers == correctAnswers &&
      other.totalQuestions == totalQuestions &&
      other.score == score &&
      other.grade == grade &&
      other.passed == passed;
  }
  
  @override
  int get hashCode {
    return correctAnswers.hashCode ^
      totalQuestions.hashCode ^
      score.hashCode ^
      grade.hashCode ^
      passed.hashCode;
  }
}