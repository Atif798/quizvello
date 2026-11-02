import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/app_logo.dart';
import '../../../../core/widgets/app_brand_text.dart';

class HomeHeaderCard extends StatelessWidget {
  const HomeHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      radius: 20,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      boxShadow: [
        BoxShadow(
          color: AppTheme.primaryColor.withValues(alpha: 0.08),
          blurRadius: 16,
          offset: const Offset(0, 6),
        ),
      ],
      child: Row(
        children: [
          const AppLogo(),
          const SizedBox(width: 12),
          const Expanded(child: AppBrandText(titleSize: 19)),
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: AppTheme.softPink,
              borderRadius: BorderRadius.circular(13),
              border: Border.all(
                color: AppTheme.borderAccentColor.withValues(alpha: 0.6),
                width: 1.2,
              ),
            ),
            child: const Icon(
              Icons.quiz_outlined,
              color: AppTheme.primaryColor,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}
