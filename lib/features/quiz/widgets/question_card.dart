import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/app_pill.dart';
import '../../quiz/models/quiz_question.dart';


class QuestionCard extends StatelessWidget {
  final QuizQuestion question;

  const QuestionCard({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      radius: 22,
      padding: const EdgeInsets.all(10),
      boxShadow: [
        BoxShadow(
          color: AppTheme.primaryColor.withValues(alpha: 0.06),
          blurRadius: 16,
          offset: const Offset(0, 6),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: const AppPill(text: 'Your Question')),
          const SizedBox(height: 14),
          Text(
            question.question,
            style: AppTheme.questionText.copyWith(
              fontSize: 16,
              height: 1.45,
              letterSpacing: -0.2,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                width: 5,
                height: 5,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.primaryColor,
                ),
              ),
              const SizedBox(width: 7),
              Text(
                'Choose one correct answer.',
                style: AppTheme.body.copyWith(fontSize: 11.5),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
