import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/app_pill.dart';
import '../../../core/widgets/app_brand_text.dart';


class QuizTopBar extends StatelessWidget {
  final int questionNumber;
  final int totalQuestions;
  final VoidCallback onClose;

  const QuizTopBar({
    super.key,
    required this.questionNumber,
    required this.totalQuestions,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      radius: 18,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Row(
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onClose,
              borderRadius: BorderRadius.circular(11),
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppTheme.softPink,
                  borderRadius: BorderRadius.circular(11),
                  border: Border.all(
                    color: AppTheme.borderAccentColor.withValues(alpha: 0.5),
                    width: 1.2,
                  ),
                ),
                child: const Icon(
                  Icons.close_rounded,
                  color: AppTheme.primaryColor,
                  size: 19,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: AppBrandText(titleSize: 16, showTagline: false),
          ),
          AppPill(text: '$questionNumber / $totalQuestions', uppercase: false),
        ],
      ),
    );
  }
}
