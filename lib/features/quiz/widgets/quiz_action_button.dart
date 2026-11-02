import 'package:flutter/material.dart';
import '../../../core/widgets/gradient_button.dart';
import '../../quiz/providers/quiz_provider.dart';


class QuizActionButton extends StatelessWidget {
  final QuizProvider quiz;
  final bool isLastQuestion;

  const QuizActionButton({
    super.key,
    required this.quiz,
    required this.isLastQuestion,
  });

  @override
  Widget build(BuildContext context) {
    final canContinue =
        quiz.isAnswerSubmitted || quiz.selectedAnswerIndex != null;

    String label;
    IconData icon;

    if (!quiz.isAnswerSubmitted) {
      label = 'Check Answer';
      icon = Icons.check_rounded;
    } else if (isLastQuestion) {
      label = 'See My Result';
      icon = Icons.emoji_events_rounded;
    } else {
      label = 'Next Question';
      icon = Icons.arrow_forward_rounded;
    }

    return GradientButton(
      label: label,
      icon: icon,
      enabled: canContinue,
      onTap: () {
        if (!quiz.isAnswerSubmitted) {
          quiz.submitAnswer();
        } else {
          quiz.nextQuestion();
        }
      },
    );
  }
}
