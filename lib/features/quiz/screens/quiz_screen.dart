import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/app_background.dart';
import '../../quiz/providers/quiz_provider.dart';
import '../widgets/quiz_top_bar.dart';
import '../widgets/quiz_progress_card.dart';
import '../widgets/question_card.dart';
import '../widgets/answer_option.dart';
import '../widgets/answer_feedback.dart';
import '../widgets/quiz_action_button.dart';
import '../widgets/quiz_result_view.dart';
import '../widgets/exit_quiz_dialog.dart';


class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
      builder: (context, quiz, child) {
        if (quiz.isQuizCompleted) {
          return QuizResultView(quiz: quiz);
        }

        final question = quiz.currentQuestion;
        final questionNumber = quiz.currentQuestionIndex + 1;
        final isLastQuestion =
            quiz.currentQuestionIndex == quiz.totalQuestions - 1;

        return Scaffold(
          backgroundColor: AppTheme.backgroundColor,
          body: Stack(
            children: [
              const AppBackground(),
              SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(22, 12, 22, 0),
                      child: QuizTopBar(
                        questionNumber: questionNumber,
                        totalQuestions: quiz.totalQuestions,
                        onClose: () => confirmExit(context, quiz),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.fromLTRB(22, 8, 22, 0),
                        child: Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 560),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                QuizProgressCard(
                                  questionNumber: questionNumber,
                                  totalQuestions: quiz.totalQuestions,
                                  progress: quiz.progress,
                                ),
                                const SizedBox(height: 10),
                                QuestionCard(question: question),
                                const SizedBox(height: 10),
                                ...List.generate(
                                  question.options.length,
                                  (index) => Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: AnswerOption(
                                      quiz: quiz,
                                      option: question.options[index],
                                      index: index,
                                      correctIndex: question.correctAnswerIndex,
                                    ),
                                  ),
                                ),
                                if (quiz.isAnswerSubmitted) ...[
                                  const SizedBox(height: 4),
                                  AnswerFeedback(
                                    quiz: quiz,
                                    question: question,
                                  ),
                                ],
                                const SizedBox(height: 6),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(22, 8, 22, 18),
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 560),
                          child: QuizActionButton(
                            quiz: quiz,
                            isLastQuestion: isLastQuestion,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> confirmExit(BuildContext context, QuizProvider quiz) async {
    final shouldExit = await ExitQuizDialog.show(context);
    if (shouldExit == true && context.mounted) {
      quiz.resetQuiz();
      Navigator.of(context).pop();
    }
  }
}
