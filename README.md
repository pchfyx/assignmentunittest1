# Flutter Unit Testing Assignment - Duolingo-Style Language Learning App

## Project Overview
This project demonstrates unit testing implementation for a simple Duolingo-style language learning application built with Flutter. The app focuses on vocabulary learning and quiz functionality.

## Chosen Functionality: Quiz Score Calculator

### Feature Description
The selected functionality is a **Quiz Score Calculator** that evaluates user performance in language learning quizzes. This feature is essential for tracking learning progress and providing feedback to users.

### Testable Logic
The core logic being tested includes:

1. **Score Calculation**: Calculates percentage score based on correct answers
2. **Grade Assignment**: Assigns letter grades (A, B, C, D, F) based on score percentage
3. **Input Validation**: Validates that inputs are within acceptable ranges
4. **Progress Tracking**: Determines if user has passed the quiz (≥70%)

### Why This Feature Was Chosen
- **Isolated Logic**: The calculation functions are pure functions with no external dependencies
- **Clear Inputs/Outputs**: Easy to test with predictable results
- **Business Critical**: Scoring accuracy is crucial for user experience
- **Edge Cases**: Multiple scenarios to test (boundary values, invalid inputs)

## Test Coverage

### Test Cases Implemented

1. **Basic Score Calculation**
   - Tests correct percentage calculation
   - Verifies mathematical accuracy

2. **Grade Assignment Logic**
   - Tests all grade boundaries (A: 90-100%, B: 80-89%, etc.)
   - Ensures proper grade assignment for each score range

3. **Edge Cases**
   - Perfect score (100%)
   - Zero score (0%)
   - Boundary values (70%, 80%, 90%)

4. **Input Validation**
   - Negative numbers handling
   - Zero total questions handling
   - Invalid input scenarios

5. **Pass/Fail Logic**
   - Tests passing threshold (≥70%)
   - Verifies proper boolean returns

## Project Structure

```
lib/
├── models/
│   └── quiz_result.dart          # Quiz result model
├── services/
│   └── quiz_calculator.dart      # Main logic being tested
└── main.dart

test/
└── quiz_calculator_test.dart     # Unit tests

pubspec.yaml                      # Dependencies
README.md                         # This file
```

## How to Run Tests

1. Navigate to project directory
2. Run tests using Flutter CLI:
   ```bash
   flutter test
   ```
3. For verbose output:
   ```bash
   flutter test --verbose
   ```

## Test Results Interpretation

Each test follows the **Arrange-Act-Assert** pattern:
- **Arrange**: Set up test data and conditions
- **Act**: Execute the function being tested
- **Assert**: Verify the expected outcome

## Key Learning Outcomes

1. **Unit Test Structure**: Understanding of proper test organization
2. **Isolation Testing**: Testing functions independently without external dependencies
3. **Edge Case Handling**: Comprehensive testing of boundary conditions
4. **Flutter Testing Framework**: Practical use of `flutter_test` package
5. **Test-Driven Mindset**: Writing tests to validate business logic

## Future Enhancements

Potential areas for additional unit testing:
- Word translation validation
- Streak calculation logic
- Difficulty progression algorithms
- User statistics calculations

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter

dev_dependencies:
  flutter_test:
    sdk: flutter
```

---

This implementation demonstrates practical unit testing principles applied to a real-world mobile application feature, following software testing best practices as outlined in the course materials.# assignmentunittest1
