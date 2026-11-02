import 'package:flutter/foundation.dart';
import '../models/quiz_data.dart';
import '../models/quiz_question.dart';


class QuizProvider extends ChangeNotifier {
  static const int fullQuizQuestionCount = 10;

  List<QuizQuestion> _questions = getFullQuizQuestions();

  int _currentQuestionIndex = 0;
  int _score = 0;
  int? _selectedAnswerIndex;
  bool _isAnswerSubmitted = false;
  bool _isQuizCompleted = false;

  static List<QuizQuestion> getFullQuizQuestions() {
    return QuizData.questions.take(fullQuizQuestionCount).toList();
  }

  List<QuizQuestion> get questions => _questions;
  int get currentQuestionIndex => _currentQuestionIndex;
  int get score => _score;
  int? get selectedAnswerIndex => _selectedAnswerIndex;
  bool get isAnswerSubmitted => _isAnswerSubmitted;
  bool get isQuizCompleted => _isQuizCompleted;
  int get totalQuestions => _questions.length;

  QuizQuestion get currentQuestion => _questions[_currentQuestionIndex];

  double get progress {
    if (totalQuestions == 0) return 0;
    return (_currentQuestionIndex + 1) / totalQuestions;
  }

  void startAllQuestions() {
    _questions = getFullQuizQuestions();

    resetProgress();
    notifyListeners();
  }

  void selectAnswer(int index) {
    if (_isAnswerSubmitted || _isQuizCompleted) return;

    if (index < 0 || index >= currentQuestion.options.length) {
      return;
    }

    _selectedAnswerIndex = index;
    notifyListeners();
  }

  void submitAnswer() {
    if (_selectedAnswerIndex == null ||
        _isAnswerSubmitted ||
        _isQuizCompleted) {
      return;
    }

    _isAnswerSubmitted = true;

    if (_selectedAnswerIndex == currentQuestion.correctAnswerIndex) {
      _score++;
    }

    notifyListeners();
  }

  void nextQuestion() {
    if (!_isAnswerSubmitted || _isQuizCompleted) return;

    if (_currentQuestionIndex < totalQuestions - 1) {
      _currentQuestionIndex++;
      _selectedAnswerIndex = null;
      _isAnswerSubmitted = false;
    } else {
      _isQuizCompleted = true;
    }

    notifyListeners();
  }

  void resetQuiz() {
    resetProgress();
    notifyListeners();
  }

  void resetProgress() {
    _currentQuestionIndex = 0;
    _score = 0;
    _selectedAnswerIndex = null;
    _isAnswerSubmitted = false;
    _isQuizCompleted = false;
  }
}
