import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AppIconBox extends StatelessWidget {
  final IconData icon;
  final double size;
  final double iconSize;
  final double radius;
  final Color? background;
  final Color? iconColor;
  final Color? borderColor;

  const AppIconBox({
    super.key,
    required this.icon,
    this.size = 42,
    this.iconSize = 21,
    this.radius = 13,
    this.background,
    this.iconColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: background ?? AppTheme.softPink,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: (borderColor ?? AppTheme.borderAccentColor).withValues(
            alpha: 0.6,
          ),
          width: 1.2,
        ),
      ),
      child: Icon(
        icon,
        color: iconColor ?? AppTheme.primaryColor,
        size: iconSize,
      ),
    );
  }
}
