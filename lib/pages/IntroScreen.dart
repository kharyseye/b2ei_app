import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        scrollPhysics: BouncingScrollPhysics(),
        pages: [
          PageViewModel(
            titleWidget: const Text("TITRE 1 A REMPLIR",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
            ),
            body: " bénéficieront d'un processus simplifié et rapide pour soumettre leurs demandes de matériel via l'application mobile",
            image: Image.asset("assets/images/efficace.png", height: 250,width: 250,)
          ),
          PageViewModel(
              titleWidget: const Text("TITRE 1 A REMPLIR",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),
              ),
              body: " bénéficieront d'un processus simplifié et rapide pour soumettre leurs demandes de matériel via l'application mobile",
              image: Image.asset("assets/images/demande.png", height: 250,width: 250,)
          ),
          PageViewModel(
              titleWidget: const Text("TITRE 1 A REMPLIR",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),
              ),
              body: " bénéficieront d'un processus simplifié et rapide pour soumettre leurs demandes de matériel via l'application mobile",
              image: Image.asset("assets/images/demande3.png", height: 250,width: 250,)
          ),
        ],
        onDone: () {
          Navigator.pushNamed(context, "home");
        },
        onSkip: () {
          Navigator.pushNamed(context, "home");
        } ,
        showSkipButton: true,
        skip: const Text(
          "Passer",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xC534B003),
          ),
        ),
        next: const Icon(
          Icons.arrow_forward,
          color: Color(0xC534B003)
        ),
        done: const Text(
          "Done",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            color: Color(0xC534B003),
          ),
        ),
        dotsDecorator: DotsDecorator(
          size: Size.square(10.0),
          activeSize: Size(20.0, 10.0),
          color: Colors.black26,
          activeColor: Color(0xC534B003),
          spacing: EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          )
        ),

      ),
    );
  }
}
