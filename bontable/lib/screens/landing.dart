import 'package:bontable/screens/home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Logo extends StatefulWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0.0, 5.0 * _controller.value),
          child: child,
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          'images/logo.png',
          width: 300,
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1B3C3D),
      body: Container(
        child: Container(
          height: double.infinity,
          padding:
              const EdgeInsets.only(top: 100, left: 20, right: 20, bottom: 20),
          child: Column(
            children: [
              const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Logo(),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 40, left: 20, right: 20, bottom: 5),
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,
                        child: const Text(
                          'Welcome to BonTable!',
                          style: TextStyle(
                            fontFamily: 'Bigshot One',
                            color: Color(0xFFEEF0E5),
                            fontSize: 64,
                          ),
                        ),
                      ),
                    ),

                    Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'Your Appetite, Our Inspiration',
                        style: TextStyle(
                          fontFamily: 'Calistoga',
                          color: Color(0xFFEEF0E5),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-2.00, 0.00),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: RichText(
                          textScaleFactor:
                              MediaQuery.of(context).textScaleFactor,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: ' CONTINUE',
                                mouseCursor: SystemMouseCursors.click,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                                secondaryAnimation) =>
                                            const HomeScreen(),
                                        transitionsBuilder: (context, animation,
                                            secondaryAnimation, child) {
                                          const begin = 0.0;
                                          const end = 1.0;
                                          const curve = Curves.easeInOut;

                                          var scaleTween =
                                              Tween(begin: begin, end: end);
                                          var fadeTween =
                                              Tween(begin: 0.0, end: 1.0);

                                          var curvedAnimation = CurvedAnimation(
                                            parent: animation,
                                            curve: curve,
                                          );

                                          var scaleAnimation = scaleTween
                                              .animate(curvedAnimation);
                                          var fadeAnimation = fadeTween
                                              .animate(curvedAnimation);

                                          return ScaleTransition(
                                            scale: scaleAnimation,
                                            child: FadeTransition(
                                              opacity: fadeAnimation,
                                              child: child,
                                            ),
                                          );
                                        },
                                        transitionDuration:
                                            const Duration(milliseconds: 500),
                                      ),
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
