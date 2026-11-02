import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_background.dart';
import '../../../../core/widgets/app_section_title.dart';
import '../../quiz/models/quiz_data.dart';
import '../widgets/home_header_card.dart';
import '../widgets/welcome_section.dart';
import '../widgets/featured_quiz_card.dart';
import '../widgets/quiz_stat_card.dart';
import '../widgets/quiz_feature_card.dart';
import '../widgets/start_quiz_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int totalQuestions = QuizData.questions.length;

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Stack(
        children: [
          const AppBackground(),
          SafeArea(
            child:  SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(22, 12, 22, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HomeHeaderCard(),
                    const SizedBox(height: 16),
                    const WelcomeSection(),
                    const SizedBox(height: 23),
                    FeaturedQuizCard(totalQuestions: totalQuestions),
                    const SizedBox(height: 20),
                    const AppSectionTitle(title: 'Quiz Overview'),
                    const SizedBox(height: 14),
                    Row(
                      children: [
                        Expanded(
                          child: QuizStatCard(
                            icon: Icons.menu_book_rounded,
                            title: '$totalQuestions',
                            subtitle: 'Total questions',
                          ),
                        ),
                        const SizedBox(width: 14),
                        const Expanded(
                          child: QuizStatCard(
                            icon: Icons.checklist_rounded,
                            title: '4',
                            subtitle: 'Options per question',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const AppSectionTitle(title: 'How It Works'),
                    const SizedBox(height: 16),
                    const QuizFeatureCard(
                      icon: Icons.touch_app_rounded,
                      title: 'Select an answer',
                      text: 'Select one answer from four options.',
                    ),
                    const SizedBox(height: 12),
                    const QuizFeatureCard(
                      icon: Icons.fact_check_outlined,
                      title: 'Instant feedback',
                      text: 'Check your answer for instant feedback.',
                    ),
                    const SizedBox(height: 12),
                    const QuizFeatureCard(
                      icon: Icons.emoji_events_outlined,
                      title: 'Final score',
                      text: 'Complete the quiz to view your final score.',
                    ),
                    const SizedBox(height: 30),
                    const StartQuizButton(),
                    const SizedBox(height: 16),
                    Center(
                      child: Text(
                        'Learn something new with every question.',
                        textAlign: TextAlign.center,
                        style: AppTheme.body.copyWith(fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
          ),
        ],
      ),
    );
  }
}
