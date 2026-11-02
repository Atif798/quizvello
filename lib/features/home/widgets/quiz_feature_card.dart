import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class QuizFeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String text;

  const QuizFeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppTheme.borderColor, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryColor.withValues(alpha: 0.06),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppTheme.softPink,
              borderRadius: BorderRadius.circular(13),
              border: Border.all(
                color: AppTheme.borderAccentColor.withValues(alpha: 0.6),
                width: 1.2,
              ),
            ),
            child: Icon(icon, color: AppTheme.primaryColor, size: 21),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTheme.sectionHeading.copyWith(
                    fontSize: 13,
                    letterSpacing: -0.1,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  text,
                  style: AppTheme.body.copyWith(fontSize: 11.5, height: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
