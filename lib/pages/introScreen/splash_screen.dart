import 'package:flutter/material.dart';
import 'package:animator/animator.dart';


class splash_screen extends StatelessWidget {
  const splash_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedLogo(),
    );
  }
}
class AnimatedLogo extends StatelessWidget {
  Widget build(BuildContext context) {
    return Animator<double>(
      tween: Tween<double>(begin: 0, end: 200),
      cycles: 0,
      duration: Duration(seconds: 3),
      builder: (context, animatorState, child ) => Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          height: animatorState.value,
          width: animatorState.value,
          child: Image.asset("assets/images/logo.png"),
          ),
      ),
    );
  }
}