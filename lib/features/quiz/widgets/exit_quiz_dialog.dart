import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/app_outline_button.dart';
import '../../../core/widgets/gradient_button.dart';


class ExitQuizDialog extends StatelessWidget {
  const ExitQuizDialog({super.key});

  static Future<bool?> show(BuildContext context) {
    return showDialog<bool>(
      context: context,
      barrierColor: AppTheme.textPrimaryColor.withValues(alpha: 0.35),
      builder: (_) => const ExitQuizDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 28),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.circular(26),
          border: Border.all(color: AppTheme.borderColor, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primaryColor.withValues(alpha: 0.20),
              blurRadius: 32,
              offset: const Offset(0, 16),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: AppTheme.softPink,
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppTheme.borderAccentColor.withValues(alpha: 0.6),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primaryColor.withValues(alpha: 0.15),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: const Icon(
                Icons.logout_rounded,
                color: AppTheme.primaryColor,
                size: 30,
              ),
            ),
            const SizedBox(height: 18),
            Text('Exit Quiz?', style: AppTheme.heading.copyWith(fontSize: 20)),
            const SizedBox(height: 8),
            Text(
              'Your current quiz progress will be lost. '
              'Are you sure you want to exit?',
              textAlign: TextAlign.center,
              style: AppTheme.body.copyWith(
                fontSize: 12.5,
                height: 1.6,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 24),
            GradientButton(
              label: 'Continue Quiz',
              icon: Icons.play_arrow_rounded,
              height: 52,
              onTap: () => Navigator.of(context).pop(false),
            ),
            const SizedBox(height: 10),
            AppOutlineButton(
              label: 'Exit',
              color: AppTheme.incorrectColor,
              height: 50,
              onTap: () => Navigator.of(context).pop(true),
            ),
          ],
        ),
      ),
    );
  }
}
