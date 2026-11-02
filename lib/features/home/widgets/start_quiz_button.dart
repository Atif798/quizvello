import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/widgets/gradient_button.dart';
import '../../quiz/providers/quiz_provider.dart';
import '../../quiz/screens/quiz_screen.dart';

class StartQuizButton extends StatelessWidget {
  const StartQuizButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientButton(
      label: 'Start Your Quiz',
      icon: Icons.play_arrow_rounded,
      height: 56,
      onTap: () => startQuiz(context),
    );
  }

  void startQuiz(BuildContext context) {
    context.read<QuizProvider>().startAllQuestions();

    Navigator.of(
      context,
    ).push(MaterialPageRoute<void>(builder: (_) => const QuizScreen()));
  }
}
