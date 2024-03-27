import 'package:b2ei_app/constant.dart';
import 'package:b2ei_app/pages/authentication/LoginPage.dart';
import 'package:b2ei_app/pages/employee_interface/Dashboard.dart';
import 'package:b2ei_app/pages/superior_interface/Dashboard_Sup.dart';
import 'package:b2ei_app/pages/welcome/DelayedAnimation.dart';
import 'package:b2ei_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key, required this.authState});
  final AuthState authState;
  @override
  Widget build(BuildContext context) {
    debugPrint(
        'auth: ${authState.isAuthenticated}, sup: ${authState.isSupervisor}');
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
                  delay: 500,
                  child: Container(
                    height: 150,
                    child: Image.asset("assets/images/logoOff.png"),
                  )),
              DelayedAnimation(
                  delay: 1000,
                  child: Container(
                    height: 400,
                    child: Image.asset("assets/images/welcome3.png"),
                  )),
              DelayedAnimation(
                  delay: 1600,
                  child: Container(
                    height: 100,
                    child: Text(
                      authState.isAuthenticated
                          ? "Content de vous revoir !"
                          : "Gérez vos demandes de matériel en un clin d'œil",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.grey.shade900,
                        fontSize: 18,
                      ),
                    ),
                  )),
              DelayedAnimation(
                  delay: 1800,
                  child: Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: PrimaryButtonColor,
                          shape: StadiumBorder(),
                          padding: EdgeInsets.all(13)),
                      child: Text(
                        authState.isAuthenticated
                            ? "Tableau de bord"
                            : "DEMARRER",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => authState.isAuthenticated
                                  ? authState.isSupervisor
                                      ? Dashboard_Sup()
                                      : Dashboard()
                                  : LoginPage(),
                            ));
                      },
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
