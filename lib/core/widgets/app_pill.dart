import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AppPill extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final IconData? icon;
  final bool uppercase;

  const AppPill({
    super.key,
    required this.text,
    this.textColor,
    this.backgroundColor,
    this.borderColor,
    this.icon,
    this.uppercase = true,
  });

  @override
  Widget build(BuildContext context) {
    final Color tColor = textColor ?? AppTheme.primaryColor;
    final Color bg = backgroundColor ?? AppTheme.softPink;
    final Color br = borderColor ?? AppTheme.borderAccentColor;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: br.withValues(alpha: 0.5), width: 1.2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, color: tColor, size: 13),
            const SizedBox(width: 6),
          ],
          Text(
            uppercase ? text.toUpperCase() : text,
            style: AppTheme.caption.copyWith(
              color: tColor,
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: uppercase ? 1.2 : 0.3,
            ),
          ),
        ],
      ),
    );
  }
}
