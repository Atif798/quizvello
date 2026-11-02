import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../quiz/providers/quiz_provider.dart';

class AnswerOption extends StatelessWidget {
  final QuizProvider quiz;
  final String option;
  final int index;
  final int correctIndex;

  const AnswerOption({
    super.key,
    required this.quiz,
    required this.option,
    required this.index,
    required this.correctIndex,
  });

  @override
  Widget build(BuildContext context) {
    final selected = quiz.selectedAnswerIndex == index;
    final submitted = quiz.isAnswerSubmitted;
    final isCorrect = index == correctIndex;

    Color borderColor = AppTheme.borderColor;
    Color backgroundColor = AppTheme.white;
    Color accentColor = AppTheme.textSecondaryColor;
    Color badgeBackground = AppTheme.softPink;
    IconData trailingIcon = Icons.circle_outlined;
    double borderWidth = 1.5;

    if (submitted && isCorrect) {
      borderColor = AppTheme.correctBorderColor;
      backgroundColor = AppTheme.correctBackgroundColor;
      accentColor = AppTheme.correctColor;
      badgeBackground = AppTheme.white;
      trailingIcon = Icons.check_circle_rounded;
      borderWidth = 1.8;
    } else if (submitted && selected) {
      borderColor = AppTheme.incorrectBorderColor;
      backgroundColor = AppTheme.incorrectBackgroundColor;
      accentColor = AppTheme.incorrectColor;
      badgeBackground = AppTheme.white;
      trailingIcon = Icons.cancel_rounded;
      borderWidth = 1.8;
    } else if (selected) {
      borderColor = AppTheme.borderAccentColor;
      backgroundColor = AppTheme.softPink;
      accentColor = AppTheme.primaryColor;
      badgeBackground = AppTheme.white;
      trailingIcon = Icons.radio_button_checked_rounded;
      borderWidth = 1.8;
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: submitted ? null : () => quiz.selectAnswer(index),
        borderRadius: BorderRadius.circular(17),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          constraints: const BoxConstraints(minHeight: 68),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(17),
            border: Border.all(color: borderColor, width: borderWidth),
            boxShadow: selected || (submitted && isCorrect)
                ? [
                    BoxShadow(
                      color: accentColor.withValues(alpha: 0.14),
                      blurRadius: 14,
                      offset: const Offset(0, 5),
                    ),
                  ]
                : null,
          ),
          child: Row(
            children: [
              Container(
                width: 38,
                height: 38,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: badgeBackground,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: accentColor.withValues(alpha: 0.35),
                    width: 1.2,
                  ),
                ),
                child: Text(
                  String.fromCharCode(65 + index),
                  style: AppTheme.body.copyWith(
                    color: accentColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 13),
              Expanded(
                child: Text(
                  option,
                  style: AppTheme.optionText.copyWith(
                    fontSize: 13,
                    height: 1.45,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Icon(trailingIcon, color: accentColor, size: 21),
            ],
          ),
        ),
      ),
    );
  }
}
