import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class FeaturedQuizCard extends StatelessWidget {
  final int totalQuestions;

  const FeaturedQuizCard({super.key, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppTheme.primaryColor, AppTheme.primaryDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppTheme.primaryLight.withValues(alpha: 0.5),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryColor.withValues(alpha: 0.32),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppTheme.white.withValues(alpha: 0.18),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppTheme.white.withValues(alpha: 0.32),
                  width: 1.2,
                ),
              ),
              child: Text(
                'FEATURED QUIZ',
                style: AppTheme.caption.copyWith(
                  color: AppTheme.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
          const SizedBox(height: 18),
          Text(
            'Knowledge is your\nsuperpower!',
            style: AppTheme.heading.copyWith(
              color: AppTheme.white,
              fontSize: 23,
              height: 1.35,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.2,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Answer each question and aim for your best score.',
            style: AppTheme.body.copyWith(
              color: AppTheme.white.withValues(alpha: 0.90),
              fontSize: 12,
              height: 1.7,
            ),
          ),
          const SizedBox(height: 22),
          Wrap(
            spacing: 18,
            runSpacing: 10,
            children: [
              buildCardInfo(
                Icons.help_outline_rounded,
                '$totalQuestions Questions',
              ),
              buildCardInfo(
                Icons.check_circle_outline_rounded,
                'Instant Feedback',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildCardInfo(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: AppTheme.white, size: 18),
        const SizedBox(width: 7),
        Text(
          text,
          style: AppTheme.caption.copyWith(
            color: AppTheme.white,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
