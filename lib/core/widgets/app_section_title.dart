import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AppSectionTitle extends StatelessWidget {
  final String title;
  final double fontSize;

  const AppSectionTitle({super.key, required this.title, this.fontSize = 18});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTheme.heading.copyWith(fontSize: fontSize, letterSpacing: -0.2),
    );
  }
}
