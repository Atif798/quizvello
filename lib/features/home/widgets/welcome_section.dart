import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';


class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final headingStyle = AppTheme.heading.copyWith(
      fontSize: 25,
      height: 1.35,
      letterSpacing: -0.3,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Ready to challenge', style: headingStyle),
        Text(
          'your mind today?',
          style: headingStyle.copyWith(color: AppTheme.primaryColor),
        ),
        const SizedBox(height: 10),
        Text(
          'Test your knowledge, learn something new, '
          'and discover how well you score.',
          style: AppTheme.body,
        ),
      ],
    );
  }
}
