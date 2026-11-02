import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/app_icon_box.dart';


class QuizProgressCard extends StatelessWidget {
  final int questionNumber;
  final int totalQuestions;
  final double progress;

  const QuizProgressCard({
    super.key,
    required this.questionNumber,
    required this.totalQuestions,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(14),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const AppIconBox(
                    icon: Icons.trending_up_rounded,
                    size: 26,
                    iconSize: 14,
                    radius: 8,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Quiz Progress',
                    style: AppTheme.body.copyWith(
                      color: AppTheme.textPrimaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Text(
                '$questionNumber of $totalQuestions',
                style: AppTheme.body.copyWith(
                  color: AppTheme.primaryColor,
                  fontSize: 11.5,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 7,
              backgroundColor: AppTheme.softPink,
              color: AppTheme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
