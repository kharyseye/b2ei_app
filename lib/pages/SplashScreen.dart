import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:b2ei_app/pages/HomePage.dart';
import 'package:b2ei_app/pages/IntroScreen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Lottie.asset("assets/images/lotti3.json")

        /*Column(
          children: [
            Image.asset("assets/images/logo.png"),
            const Text("DEMANDE DE MATERIEL",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
            )
          ],
        ),*/,
        //backgroundColor: Colors.red,
        nextScreen: IntroScreen(),
        splashIconSize: 500,
      duration: 3000,
      splashTransition: SplashTransition.rotationTransition,
      pageTransitionType: PageTransitionType.topToBottom,
    );
  }
}
