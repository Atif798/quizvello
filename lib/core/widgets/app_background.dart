import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -100,
          right: -90,
          child: blob(240, AppTheme.primaryColor.withValues(alpha: 0.12)),
        ),
        Positioned(
          top: 80,
          right: -40,
          child: blob(100, AppTheme.primaryLight.withValues(alpha: 0.18)),
        ),
        Positioned(
          top: 340,
          left: -70,
          child: blob(160, AppTheme.primaryColor.withValues(alpha: 0.10)),
        ),
        Positioned(
          bottom: 40,
          right: -60,
          child: blob(180, AppTheme.primaryLight.withValues(alpha: 0.14)),
        ),
        Positioned(
          bottom: -50,
          left: -40,
          child: blob(140, AppTheme.primaryColor.withValues(alpha: 0.08)),
        ),
      ],
    );
  }

  Widget blob(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}
