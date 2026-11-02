import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/app_background.dart';
import '../../../core/widgets/app_card.dart';
import '../../features/home/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController entranceController;
  late final AnimationController floatController;
  late final AnimationController orbitController;
  late final AnimationController bubbleController;

  late final Animation<double> fadeAnim;
  late final Animation<double> scaleAnim;
  late final Animation<Offset> slideAnim;

  final math.Random random = math.Random();
  final List<Bubble> bubbles = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 20; i++) {
      bubbles.add(
        Bubble(
          x: random.nextDouble(),
          y: random.nextDouble(),
          size: 6 + random.nextDouble() * 14,
          speed: 0.2 + random.nextDouble() * 0.6,
          opacity: 0.08 + random.nextDouble() * 0.15,
        ),
      );
    }

    entranceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );

    fadeAnim = CurvedAnimation(
      parent: entranceController,
      curve: const Interval(
        0.0,
        0.5,
        curve: Curves.easeIn,
      ),
    );

    scaleAnim = Tween<double>(
      begin: 0.3,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: entranceController,
        curve: const Interval(
          0.0,
          0.6,
          curve: Curves.easeOutBack,
        ),
      ),
    );

    slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.6),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: entranceController,
        curve: const Interval(
          0.4,
          1.0,
          curve: Curves.easeOutCubic,
        ),
      ),
    );

    floatController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    )..repeat(reverse: true);

    orbitController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();

    bubbleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat();

    entranceController.forward();
    openHomeScreen();
  }

  Future<void> openHomeScreen() async {
    await Future<void>.delayed(
      const Duration(milliseconds: 3000),
    );

    if (!mounted) return;

    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (_) => const HomeScreen(),
      ),
    );
  }

  @override
  void dispose() {
    entranceController.dispose();
    floatController.dispose();
    orbitController.dispose();
    bubbleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Stack(
        children: [
          // Radial background glow
          buildBackgroundGlow(),
          // Reusable decorative background blobs
          const Positioned.fill(
            child: AppBackground(),
          ),
          // Animated falling bubbles
          buildFallingBubbles(),
          // Animated floating glass cards
          buildFloatingCards(),
          // Main splash content
          SafeArea(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo
                      FadeTransition(
                          opacity: fadeAnim,
                          child: ScaleTransition(
                            scale: scaleAnim,
                            child: buildFloatingOrbitLogo(),
                          )
                      ),

                      // Brand text
                      SlideTransition(
                        position: slideAnim,
                        child: FadeTransition(
                          opacity: fadeAnim,
                          child: buildBrandText(),
                        ),
                      ),

                      SizedBox(height: 10),
                      // Tagline pill
                      SlideTransition(
                        position: slideAnim,
                        child: FadeTransition(
                          opacity: fadeAnim,
                          child: buildTaglinePill(),
                        ),
                      ),
                      SizedBox(height: 50),
                      // Progress
                      FadeTransition(
                        opacity: fadeAnim,
                        child: buildProgressLine(),
                      ),
                      SizedBox(height: 16),
                      // Loading dots
                      FadeTransition(
                        opacity: fadeAnim,
                        child: buildLoadingDots(),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildBackgroundGlow() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.0,
            colors: [
              AppTheme.softPink.withValues(alpha: 0.9),
              AppTheme.backgroundColor,
              AppTheme.backgroundColor,
            ],
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
      ),
    );
  }

  Widget buildFallingBubbles() {
    return AnimatedBuilder(
      animation: bubbleController,
      builder: (context, child) {
        final screenSize = MediaQuery.sizeOf(context);

        return Stack(
          children: bubbles.map((bubble) {
            final progress =
                ((bubbleController.value * bubble.speed) +
                    bubble.y) %
                    1.0;

            return Positioned(
              left: bubble.x * screenSize.width,
              top: progress * screenSize.height,
              child: Container(
                width: bubble.size,
                height: bubble.size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.primaryColor.withValues(
                    alpha: bubble.opacity,
                  ),
                  border: Border.all(
                    color: AppTheme.primaryColor.withValues(
                      alpha: (bubble.opacity + 0.1)
                          .clamp(0.0, 1.0),
                    ),
                    width: 1,
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Widget buildFloatingCards() {
    return AnimatedBuilder(
      animation: floatController,
      builder: (context, child) {
        return Stack(
          children: [
            // Top left
            Positioned(
              top: 100 + (floatController.value * 12),
              left: -20,
              child: glassCard(
                width: 90,
                height: 90,
                rotate: -0.2,
                icon: Icons.help_outline_rounded,
                color: AppTheme.primaryColor.withValues(
                  alpha: 0.3,
                ),
              ),
            ),

            // Top right
            Positioned(
              top: 160 - (floatController.value * 10),
              right: -20,
              child: glassCard(
                width: 80,
                height: 80,
                rotate: 0.15,
                icon: Icons.emoji_events_outlined,
                color: AppTheme.primaryDark.withValues(
                  alpha: 0.25,
                ),
              ),
            ),

            // Bottom left
            Positioned(
              bottom: 180 + (floatController.value * 8),
              left: -10,
              child: glassCard(
                width: 70,
                height: 70,
                rotate: 0.25,
                icon: Icons.bolt_rounded,
                color: AppTheme.primaryLight.withValues(
                  alpha: 0.4,
                ),
              ),
            ),

            // Bottom right
            Positioned(
              bottom: 330 - (floatController.value * 14),
              right: -25,
              child: glassCard(
                width: 100,
                height: 100,
                rotate: -0.15,
                icon: Icons.quiz_rounded,
                color: AppTheme.primaryColor.withValues(
                  alpha: 0.28,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget glassCard({
    required double width,
    required double height,
    required double rotate,
    required IconData icon,
    required Color color,
  }) {
    return Transform.rotate(
      angle: rotate,
      child: SizedBox(
        width: width,
        height: height,
        child: AppCard(
          padding: EdgeInsets.zero,
          radius: 22,
          color: AppTheme.white.withValues(alpha: 0.55),
          borderColor: AppTheme.white.withValues(alpha: 0.7),
          borderWidth: 1.5,
          boxShadow: [
            BoxShadow(
              color: AppTheme.primaryColor.withValues(
                alpha: 0.08,
              ),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
          child: Center(
            child: Icon(
              icon,
              size: width * 0.4,
              color: color,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFloatingOrbitLogo() {
    return AnimatedBuilder(
      animation: floatController,
      builder: (context, child) {
        final floatOffset =
            -8 * math.sin(floatController.value * math.pi);

        return Transform.translate(
          offset: Offset(0, floatOffset),
          child: SizedBox(
            width: 200,
            height: 200,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Orbit path
                Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppTheme.primaryColor.withValues(
                        alpha: 0.08,
                      ),
                      width: 1.5,
                    ),
                  ),
                ),

                // Rotating orbit dots
                AnimatedBuilder(
                  animation: orbitController,
                  builder: (context, child) {
                    return Stack(
                      alignment: Alignment.center,
                      children: List.generate(3, (index) {
                        final angle =
                            (orbitController.value *
                                2 *
                                math.pi) +
                                (index * 2 * math.pi / 3);

                        const radius = 90.0;

                        final dx = math.cos(angle) * radius;
                        final dy = math.sin(angle) * radius;

                        final dotColor = index == 0
                            ? AppTheme.primaryColor
                            : index == 1
                            ? AppTheme.primaryLight
                            : AppTheme.primaryDark;

                        return Transform.translate(
                          offset: Offset(dx, dy),
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: dotColor,
                              boxShadow: [
                                BoxShadow(
                                  color: AppTheme.primaryColor
                                      .withValues(alpha: 0.4),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),

                // Main Q logo
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [
                        AppTheme.primaryLight,
                        AppTheme.primaryColor,
                        AppTheme.primaryDark,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.0, 0.5, 1.0],
                    ),
                    border: Border.all(
                      color: AppTheme.white.withValues(alpha: 0.4),
                      width: 3,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.primaryColor.withValues(
                          alpha: 0.35,
                        ),
                        blurRadius: 40,
                        spreadRadius: 4,
                        offset: const Offset(0, 16),
                      ),
                      BoxShadow(
                        color: AppTheme.primaryDark.withValues(
                          alpha: 0.2,
                        ),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Q',
                      style: AppTheme.appTitle.copyWith(
                        color: AppTheme.white,
                        fontSize: 72,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -3,
                        height: 1,
                        shadows: [
                          Shadow(
                            color: AppTheme.primaryDark.withValues(
                              alpha: 0.3,
                            ),
                            offset: const Offset(0, 4),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Sparkle
                Positioned(
                  top: 30,
                  right: 30,
                  child: sparkle(12),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget sparkle(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppTheme.white,
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryColor.withValues(alpha: 0.5),
            blurRadius: 12,
          ),
        ],
      ),
    );
  }

  Widget buildBrandText() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Quiz',
            style: AppTheme.heading.copyWith(
              fontSize: 40,
              fontWeight: FontWeight.w800,
              letterSpacing: -1.5,
              color: AppTheme.textPrimaryColor,
            ),
          ),
          TextSpan(
            text: 'vello',
            style: AppTheme.heading.copyWith(
              fontSize: 40,
              fontWeight: FontWeight.w800,
              letterSpacing: -1.5,
              foreground: Paint()
                ..shader = const LinearGradient(
                  colors: [
                    AppTheme.primaryColor,
                    AppTheme.primaryDark,
                  ],
                ).createShader(
                  const Rect.fromLTWH(0, 0, 200, 40),
                ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTaglinePill() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: AppTheme.white.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: AppTheme.borderAccentColor.withValues(
            alpha: 0.5,
          ),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryColor.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Text(
        'Learn  ·  Play  ·  Grow',
        style: AppTheme.caption.copyWith(
          fontSize: 12,
          letterSpacing: 2.0,
          fontWeight: FontWeight.w700,
          color: AppTheme.primaryDark,
        ),
      ),
    );
  }

  Widget buildProgressLine() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: SizedBox(
        height: 6,
        child: AnimatedBuilder(
          animation: orbitController,
          builder: (context, child) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  // Track
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppTheme.softPink,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),

                  // Moving shimmer — left → right
                  Align(
                    alignment: Alignment(
                      -1.0 + (orbitController.value * 2.0),
                      0,
                    ),
                    child: Container(
                      width: 40,
                      height: 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            AppTheme.primaryLight.withValues(alpha: 0.0),
                            AppTheme.primaryColor,
                            AppTheme.primaryLight.withValues(alpha: 0.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildLoadingDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return AnimatedBuilder(
          animation: floatController,
          builder: (context, child) {
            final delay = index * 0.2;
            final animationValue =
                (floatController.value + delay) % 1.0;

            final pulse = (1 -
                (animationValue - 0.5).abs() * 2)
                .clamp(0.0, 1.0);

            final opacity = 0.3 + (0.7 * pulse);
            final scale = 0.6 + (0.4 * pulse);

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Transform.scale(
                scale: scale,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppTheme.primaryColor.withValues(
                      alpha: opacity,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}

class Bubble {
  final double x;
  final double y;
  final double size;
  final double speed;
  final double opacity;

  const Bubble({
    required this.x,
    required this.y,
    required this.size,
    required this.speed,
    required this.opacity,
  });
}
