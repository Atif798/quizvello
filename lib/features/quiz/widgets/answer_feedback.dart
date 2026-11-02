import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../quiz/models/quiz_question.dart';
import '../../quiz/providers/quiz_provider.dart';

class AnswerFeedback extends StatelessWidget {
  final QuizProvider quiz;
  final QuizQuestion question;

  const AnswerFeedback({super.key, required this.quiz, required this.question});

  @override
  Widget build(BuildContext context) {
    final isCorrect = quiz.selectedAnswerIndex == question.correctAnswerIndex;

    final color = isCorrect ? AppTheme.correctColor : AppTheme.incorrectColor;
    final background = isCorrect
        ? AppTheme.correctBackgroundColor
        : AppTheme.incorrectBackgroundColor;
    final border = isCorrect
        ? AppTheme.correctBorderColor
        : AppTheme.incorrectBorderColor;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: border, width: 1.3),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppTheme.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: color.withValues(alpha: 0.3),
                width: 1.2,
              ),
            ),
            child: Icon(
              isCorrect ? Icons.check_circle_rounded : Icons.info_rounded,
              color: color,
              size: 18,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isCorrect ? 'Correct answer!' : 'Not quite!',
                  style: AppTheme.body.copyWith(
                    color: color,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.1,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  isCorrect
                      ? 'Well done. Keep up the good work.'
                      : 'Correct answer: '
                            '${question.options[question.correctAnswerIndex]}',
                  style: AppTheme.body.copyWith(
                    color: AppTheme.textPrimaryColor,
                    fontSize: 11.5,
                    height: 1.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
