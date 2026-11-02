import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizvello/core/splash%20screen/splash_screen.dart';
import 'core/theme/app_theme.dart';
import 'features/quiz/providers/quiz_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => QuizProvider(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizvello',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
