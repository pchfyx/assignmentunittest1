// test/quiz_calculator_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:talkalingo/services/quiz_calculator.dart';
import 'package:talkalingo/models/quiz_result.dart';

void main() {
  group('QuizCalculator Tests', () {
    
    group('calculateScore', () {
      test('calculates correct percentage for perfect score', () {
        // Arrange
        const correctAnswers = 10;
        const totalQuestions = 10;
        
        // Act
        final result = QuizCalculator.calculateScore(correctAnswers, totalQuestions);
        
        // Assert
        expect(result, equals(100.0));
      });
      
      test('calculates correct percentage for partial score', () {
        // Arrange
        const correctAnswers = 7;
        const totalQuestions = 10;
        
        // Act
        final result = QuizCalculator.calculateScore(correctAnswers, totalQuestions);
        
        // Assert
        expect(result, equals(70.0));
      });
      
      test('calculates correct percentage for zero score', () {
        // Arrange
        const correctAnswers = 0;
        const totalQuestions = 10;
        
        // Act
        final result = QuizCalculator.calculateScore(correctAnswers, totalQuestions);
        
        // Assert
        expect(result, equals(0.0));
      });
      
      test('handles fractional percentages correctly', () {
        // Arrange
        const correctAnswers = 1;
        const totalQuestions = 3;
        
        // Act
        final result = QuizCalculator.calculateScore(correctAnswers, totalQuestions);
        
        // Assert
        expect(result, closeTo(33.33, 0.01));
      });
      
      test('throws error for negative correct answers', () {
        // Arrange
        const correctAnswers = -1;
        const totalQuestions = 10;
        
        // Act & Assert
        expect(
          () => QuizCalculator.calculateScore(correctAnswers, totalQuestions),
          throwsA(isA<ArgumentError>()),
        );
      });
      
      test('throws error for zero total questions', () {
        // Arrange
        const correctAnswers = 5;
        const totalQuestions = 0;
        
        // Act & Assert
        expect(
          () => QuizCalculator.calculateScore(correctAnswers, totalQuestions),
          throwsA(isA<ArgumentError>()),
        );
      });
      
      test('throws error when correct answers exceed total questions', () {
        // Arrange
        const correctAnswers = 15;
        const totalQuestions = 10;
        
        // Act & Assert
        expect(
          () => QuizCalculator.calculateScore(correctAnswers, totalQuestions),
          throwsA(isA<ArgumentError>()),
        );
      });
    });
    
    group('assignGrade', () {
      test('assigns A grade for scores 90 and above', () {
        // Arrange
        const scores = [90.0, 95.0, 100.0];
        
        for (final score in scores) {
          // Act
          final result = QuizCalculator.assignGrade(score);
          
          // Assert
          expect(result, equals('A'), reason: 'Score $score should get grade A');
        }
      });
      
      test('assigns B grade for scores 80-89', () {
        // Arrange
        const scores = [80.0, 85.0, 89.0];
        
        for (final score in scores) {
          // Act
          final result = QuizCalculator.assignGrade(score);
          
          // Assert
          expect(result, equals('B'), reason: 'Score $score should get grade B');
        }
      });
      
      test('assigns C grade for scores 70-79', () {
        // Arrange
        const scores = [70.0, 75.0, 79.0];
        
        for (final score in scores) {
          // Act
          final result = QuizCalculator.assignGrade(score);
          
          // Assert
          expect(result, equals('C'), reason: 'Score $score should get grade C');
        }
      });
      
      test('assigns D grade for scores 60-69', () {
        // Arrange
        const scores = [60.0, 65.0, 69.0];
        
        for (final score in scores) {
          // Act
          final result = QuizCalculator.assignGrade(score);
          
          // Assert
          expect(result, equals('D'), reason: 'Score $score should get grade D');
        }
      });
      
      test('assigns F grade for scores below 60', () {
        // Arrange
        const scores = [0.0, 30.0, 59.0];
        
        for (final score in scores) {
          // Act
          final result = QuizCalculator.assignGrade(score);
          
          // Assert
          expect(result, equals('F'), reason: 'Score $score should get grade F');
        }
      });
      
      test('throws error for invalid score range', () {
        // Arrange
        const invalidScores = [-1.0, 101.0];
        
        for (final score in invalidScores) {
          // Act & Assert
          expect(
            () => QuizCalculator.assignGrade(score),
            throwsA(isA<ArgumentError>()),
            reason: 'Score $score should throw ArgumentError',
          );
        }
      });
    });
    
    group('hasPassed', () {
      test('returns true for passing scores (70% and above)', () {
        // Arrange
        const passingScores = [70.0, 80.0, 90.0, 100.0];
        
        for (final score in passingScores) {
          // Act
          final result = QuizCalculator.hasPassed(score);
          
          // Assert
          expect(result, isTrue, reason: 'Score $score should be passing');
        }
      });
      
      test('returns false for failing scores (below 70%)', () {
        // Arrange
        const failingScores = [0.0, 30.0, 60.0, 69.9];
        
        for (final score in failingScores) {
          // Act
          final result = QuizCalculator.hasPassed(score);
          
          // Assert
          expect(result, isFalse, reason: 'Score $score should be failing');
        }
      });
      
      test('handles boundary case of exactly 70%', () {
        // Arrange
        const boundaryScore = 70.0;
        
        // Act
        final result = QuizCalculator.hasPassed(boundaryScore);
        
        // Assert
        expect(result, isTrue);
      });
    });
    
    group('calculateQuizResult', () {
      test('creates complete quiz result with all correct calculations', () {
        // Arrange
        const correctAnswers = 8;
        const totalQuestions = 10;
        
        // Act
        final result = QuizCalculator.calculateQuizResult(correctAnswers, totalQuestions);
        
        // Assert
        expect(result.correctAnswers, equals(8));
        expect(result.totalQuestions, equals(10));
        expect(result.score, equals(80.0));
        expect(result.grade, equals('B'));
        expect(result.passed, isTrue);
      });
      
      test('creates quiz result for failing case', () {
        // Arrange
        const correctAnswers = 5;
        const totalQuestions = 10;
        
        // Act
        final result = QuizCalculator.calculateQuizResult(correctAnswers, totalQuestions);
        
        // Assert
        expect(result.correctAnswers, equals(5));
        expect(result.totalQuestions, equals(10));
        expect(result.score, equals(50.0));
        expect(result.grade, equals('F'));
        expect(result.passed, isFalse);
      });
    });
    
    group('questionsNeededForScore', () {
      test('calculates correct number of questions needed for target score', () {
        // Arrange
        const targetScore = 80.0;
        const totalQuestions = 10;
        
        // Act
        final result = QuizCalculator.questionsNeededForScore(targetScore, totalQuestions);
        
        // Assert
        expect(result, equals(8));
      });
      
      test('rounds up for fractional results', () {
        // Arrange
        const targetScore = 70.0;
        const totalQuestions = 3;
        
        // Act
        final result = QuizCalculator.questionsNeededForScore(targetScore, totalQuestions);
        
        // Assert
        expect(result, equals(3)); // 2.1 rounded up to 3
      });
      
      test('handles perfect score requirement', () {
        // Arrange
        const targetScore = 100.0;
        const totalQuestions = 5;
        
        // Act
        final result = QuizCalculator.questionsNeededForScore(targetScore, totalQuestions);
        
        // Assert
        expect(result, equals(5));
      });
      
      test('throws error for invalid target score', () {
        // Arrange
        const targetScore = 110.0;
        const totalQuestions = 10;
        
        // Act & Assert
        expect(
          () => QuizCalculator.questionsNeededForScore(targetScore, totalQuestions),
          throwsA(isA<ArgumentError>()),
        );
      });
    });
  });
  
  group('Integration Tests', () {
    test('complete workflow: calculate score, assign grade, check pass status', () {
      // Arrange
      const correctAnswers = 9;
      const totalQuestions = 10;
      
      // Act
      final score = QuizCalculator.calculateScore(correctAnswers, totalQuestions);
      final grade = QuizCalculator.assignGrade(score);
      final passed = QuizCalculator.hasPassed(score);
      
      // Assert
      expect(score, equals(90.0));
      expect(grade, equals('A'));
      expect(passed, isTrue);
    });
    
    test('edge case: minimum passing score', () {
      // Arrange
      const correctAnswers = 7;
      const totalQuestions = 10;
      
      // Act
      final result = QuizCalculator.calculateQuizResult(correctAnswers, totalQuestions);
      
      // Assert
      expect(result.score, equals(70.0));
      expect(result.grade, equals('C'));
      expect(result.passed, isTrue);
    });
    
    test('edge case: just below passing score', () {
      // Arrange
      const correctAnswers = 6;
      const totalQuestions = 10;
      
      // Act
      final result = QuizCalculator.calculateQuizResult(correctAnswers, totalQuestions);
      
      // Assert
      expect(result.score, equals(60.0));
      expect(result.grade, equals('D'));
      expect(result.passed, isFalse);
    });
  });
}