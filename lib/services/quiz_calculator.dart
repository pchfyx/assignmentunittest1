// lib/services/quiz_calculator.dart

import '../models/quiz_result.dart';

/// Service class for calculating quiz scores and grades
/// This class contains the core logic for our Talkalingo language learning app
class QuizCalculator {
  
  /// Calculates the percentage score based on correct answers
  /// 
  /// [correctAnswers] - Number of questions answered correctly
  /// [totalQuestions] - Total number of questions in the quiz
  /// 
  /// Returns a double representing the percentage score (0.0 to 100.0)
  /// Throws ArgumentError if inputs are invalid
  static double calculateScore(int correctAnswers, int totalQuestions) {
    if (correctAnswers < 0) {
      throw ArgumentError('Correct answers cannot be negative');
    }
    
    if (totalQuestions <= 0) {
      throw ArgumentError('Total questions must be greater than zero');
    }
    
    if (correctAnswers > totalQuestions) {
      throw ArgumentError('Correct answers cannot exceed total questions');
    }
    
    return (correctAnswers / totalQuestions) * 100;
  }
  
  /// Assigns a letter grade based on the percentage score
  /// 
  /// [score] - Percentage score (0.0 to 100.0)
  /// 
  /// Returns a String representing the letter grade:
  /// A: 90-100%, B: 80-89%, C: 70-79%, D: 60-69%, F: below 60%
  static String assignGrade(double score) {
    if (score < 0 || score > 100) {
      throw ArgumentError('Score must be between 0 and 100');
    }
    
    if (score >= 90) return 'A';
    if (score >= 80) return 'B';
    if (score >= 70) return 'C';
    if (score >= 60) return 'D';
    return 'F';
  }
  
  /// Determines if the user has passed the quiz
  /// 
  /// [score] - Percentage score (0.0 to 100.0)
  /// 
  /// Returns true if score is 70% or higher, false otherwise
  static bool hasPassed(double score) {
    if (score < 0 || score > 100) {
      throw ArgumentError('Score must be between 0 and 100');
    }
    
    return score >= 70.0;
  }
  
  /// Creates a complete quiz result with all calculated values
  /// 
  /// [correctAnswers] - Number of questions answered correctly
  /// [totalQuestions] - Total number of questions in the quiz
  /// 
  /// Returns a QuizResult object containing score, grade, and pass status
  static QuizResult calculateQuizResult(int correctAnswers, int totalQuestions) {
    final score = calculateScore(correctAnswers, totalQuestions);
    final grade = assignGrade(score);
    final passed = hasPassed(score);
    
    return QuizResult(
      correctAnswers: correctAnswers,
      totalQuestions: totalQuestions,
      score: score,
      grade: grade,
      passed: passed,
    );
  }
  
  /// Calculates the number of questions needed to achieve a target score
  /// 
  /// [targetScore] - Desired percentage score (0.0 to 100.0)
  /// [totalQuestions] - Total number of questions in the quiz
  /// 
  /// Returns the minimum number of correct answers needed
  static int questionsNeededForScore(double targetScore, int totalQuestions) {
    if (targetScore < 0 || targetScore > 100) {
      throw ArgumentError('Target score must be between 0 and 100');
    }
    
    if (totalQuestions <= 0) {
      throw ArgumentError('Total questions must be greater than zero');
    }
    
    return (targetScore * totalQuestions / 100).ceil();
  }
}