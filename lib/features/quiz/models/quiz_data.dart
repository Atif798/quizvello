import 'quiz_question.dart';

class QuizData {
  QuizData._();

  static const List<QuizQuestion> questions = [
    QuizQuestion(
      question: 'Which programming language is used by Flutter?',
      options: ['Java', 'Dart', 'Kotlin', 'Swift'],
      correctAnswerIndex: 1,
    ),
    QuizQuestion(
      question: 'Which planet is known as the Red Planet?',
      options: ['Earth', 'Venus', 'Mars', 'Jupiter'],
      correctAnswerIndex: 2,
    ),
    QuizQuestion(
      question: 'What is the capital of Pakistan?',
      options: ['Lahore', 'Karachi', 'Peshawar', 'Islamabad'],
      correctAnswerIndex: 3,
    ),
    QuizQuestion(
      question: 'What is 12 × 8?',
      options: ['84', '96', '88', '108'],
      correctAnswerIndex: 1,
    ),
    QuizQuestion(
      question: 'What does CPU stand for?',
      options: [
        'Central Processing Unit',
        'Computer Personal Unit',
        'Central Program Utility',
        'Control Processing User',
      ],
      correctAnswerIndex: 0,
    ),
    QuizQuestion(
      question: 'Which company developed the Android operating system?',
      options: ['Apple', 'Microsoft', 'Google', 'IBM'],
      correctAnswerIndex: 2,
    ),
    QuizQuestion(
      question: 'Which gas do plants absorb from the atmosphere?',
      options: ['Oxygen', 'Nitrogen', 'Hydrogen', 'Carbon dioxide'],
      correctAnswerIndex: 3,
    ),
    QuizQuestion(
      question: 'How many sides does a hexagon have?',
      options: ['Five', 'Six', 'Seven', 'Eight'],
      correctAnswerIndex: 1,
    ),
    QuizQuestion(
      question: 'What is the main input device used for typing?',
      options: ['Monitor', 'Printer', 'Keyboard', 'Speaker'],
      correctAnswerIndex: 2,
    ),
    QuizQuestion(
      question: 'Which is the largest ocean on Earth?',
      options: [
        'Atlantic Ocean',
        'Indian Ocean',
        'Arctic Ocean',
        'Pacific Ocean',
      ],
      correctAnswerIndex: 3,
    ),
  ];
}
