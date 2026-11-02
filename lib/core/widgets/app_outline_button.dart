import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AppOutlineButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback? onTap;
  final Color? color;
  final double height;

  const AppOutlineButton({
    super.key,
    required this.label,
    this.icon,
    required this.onTap,
    this.color,
    this.height = 54,
  });

  @override
  Widget build(BuildContext context) {
    final Color buttonColor = color ?? AppTheme.primaryColor;

    return SizedBox(
      width: double.infinity,
      height: height,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          foregroundColor: buttonColor,
          backgroundColor: AppTheme.white.withValues(alpha: 0.7),
          side: BorderSide(
            color: buttonColor.withValues(alpha: 0.35),
            width: 1.5,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 19),
              const SizedBox(width: 8),
            ],
            Flexible(
              child: Text(
                label,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: AppTheme.buttonText.copyWith(
                  color: buttonColor,
                  fontSize: 13.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
