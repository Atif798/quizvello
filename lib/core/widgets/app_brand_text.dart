import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AppBrandText extends StatelessWidget {
  final double titleSize;
  final bool showTagline;

  const AppBrandText({super.key, this.titleSize = 19, this.showTagline = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Quizvello',
          style: AppTheme.sectionHeading.copyWith(
            fontSize: titleSize,
            letterSpacing: -0.2,
          ),
        ),
        if (showTagline) ...[
          const SizedBox(height: 1),
          Text(
            'Learn. Play. Grow.',
            style: AppTheme.caption.copyWith(fontSize: 11, letterSpacing: 0.2),
          ),
        ],
      ],
    );
  }
}
