import 'package:b2ei_app/constant.dart';
import 'package:b2ei_app/pages/authentication/LoginPage.dart';
import 'package:b2ei_app/pages/welcome/DelayedAnimation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../authentication/AuthenticationPage.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Background,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 60,
            horizontal: 30,
          ),
          child: Column(
            children: [
              DelayedAnimation(
                  delay: 1500,
                  child: Container(
                  height: 150,
                  child: Image.asset("assets/images/logoOff.png"),
                  )),
              DelayedAnimation(
                  delay: 2500,
                  child: Container(
                    height: 400,
                    child: Image.asset("assets/images/welcome3.png"),
                  )),
              DelayedAnimation(
                  delay: 3500,
                  child: Container(
                    height: 100,
                    child: Text("Gérez vos demandes de matériel en un clin d'œil",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.grey.shade900,
                        fontSize: 18,
                      ),
                    ),
                  )),
              DelayedAnimation(
                  delay: 4500,
                  child: Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: PrimaryButtonColor,
                        shape: StadiumBorder(),
                        padding: EdgeInsets.all(13)
                      ),
                      child: Text("DEMARRER",
                      style: TextStyle(
                        color: Colors.white
                      ),
                      ),
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage(),
                            )
                        );
                      },
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
