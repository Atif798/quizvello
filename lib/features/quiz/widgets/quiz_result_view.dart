import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/app_background.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/app_outline_button.dart';
import '../../../core/widgets/app_pill.dart';
import '../../../core/widgets/gradient_button.dart';
import '../../quiz/providers/quiz_provider.dart';
import 'result_stat_card.dart';


class QuizResultView extends StatelessWidget {
  final QuizProvider quiz;

  const QuizResultView({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    final total = quiz.totalQuestions;
    final score = quiz.score;
    final wrongAnswers = total - score;
    final percentage = total == 0 ? 0 : (score / total * 100).round();

    final String title;
    final String message;
    final IconData resultIcon;
    final Color resultColor;
    final Color resultBackground;

    if (percentage >= 90) {
      title = 'Outstanding!';
      message = 'Excellent work! You achieved a top score.';
      resultIcon = Icons.emoji_events_rounded;
      resultColor = AppTheme.correctColor;
      resultBackground = AppTheme.correctBackgroundColor;
    } else if (percentage >= 60) {
      title = 'Good Effort!';
      message = 'You completed the quiz. Keep learning and improving!';
      resultIcon = Icons.workspace_premium_rounded;
      resultColor = AppTheme.primaryColor;
      resultBackground = AppTheme.softPink;
    } else {
      title = 'Keep Practicing!';
      message = 'Review what you learned and try the quiz again.';
      resultIcon = Icons.trending_up_rounded;
      resultColor = AppTheme.warningColor;
      resultBackground = AppTheme.warningBackgroundColor;
    }

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Stack(
        children: [
          const AppBackground(),
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(22, 8, 22, 10),
                child: Column(
                  children: [
                    Container(
                      width: 96,
                      height: 96,
                      decoration: BoxDecoration(
                        color: resultBackground,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: resultColor.withValues(alpha: 0.25),
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: resultColor.withValues(alpha: 0.18),
                            blurRadius: 22,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Icon(
                        resultIcon,
                        color: resultColor,
                        size: 52,
                      ),
                    ),
                    const SizedBox(height: 13),
                    const AppPill(text: 'Quiz Completed'),
                    const SizedBox(height: 11),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: AppTheme.heading.copyWith(
                        fontSize: 27,
                        letterSpacing: -0.4,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: AppTheme.body.copyWith(fontSize: 12),
                    ),
                    const SizedBox(height: 11),
                    AppCard(
                      radius: 24,
                      padding: const EdgeInsets.all(22),
                      gradient: const LinearGradient(
                        colors: [
                          AppTheme.primaryColor,
                          AppTheme.primaryDark,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderColor: AppTheme.primaryLight.withValues(
                        alpha: 0.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.primaryColor.withValues(
                            alpha: 0.32,
                          ),
                          blurRadius: 24,
                          offset: const Offset(0, 12),
                        ),
                      ],
                      child: Column(
                        children: [
                          Text(
                            'YOUR FINAL SCORE',
                            style: AppTheme.body.copyWith(
                              color: AppTheme.white.withValues(
                                alpha: 0.9,
                              ),
                              fontSize: 10,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 9),
                          Text(
                            '$percentage%',
                            style: AppTheme.scoreText.copyWith(
                              color: AppTheme.white,
                              fontSize: 48,
                              height: 1,
                              letterSpacing: -1.5,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '$score out of $total correct',
                            style: AppTheme.body.copyWith(
                              color: AppTheme.white.withValues(
                                alpha: 0.88,
                              ),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 16),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: LinearProgressIndicator(
                              value: percentage / 100,
                              minHeight: 9,
                              backgroundColor: AppTheme.white.withValues(
                                alpha: 0.25,
                              ),
                              color: AppTheme.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: ResultStatCard(
                            icon: Icons.check_circle_rounded,
                            label: 'Correct',
                            value: '$score',
                            color: AppTheme.correctColor,
                            background: AppTheme.correctBackgroundColor,
                            border: AppTheme.correctBorderColor,
                          ),
                        ),
                        const SizedBox(width: 11),
                        Expanded(
                          child: ResultStatCard(
                            icon: Icons.cancel_rounded,
                            label: 'Incorrect',
                            value: '$wrongAnswers',
                            color: AppTheme.incorrectColor,
                            background: AppTheme.incorrectBackgroundColor,
                            border: AppTheme.incorrectBorderColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    GradientButton(
                      label: 'Try Again',
                      icon: Icons.refresh_rounded,
                      onTap: quiz.resetQuiz,
                    ),
                    const SizedBox(height: 9),
                    AppOutlineButton(
                      label: 'Back to Home',
                      icon: Icons.home_rounded,
                      onTap: () {
                        quiz.resetQuiz();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}
