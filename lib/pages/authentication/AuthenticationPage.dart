import 'package:b2ei_app/constant.dart';
import 'package:b2ei_app/pages/welcome/DelayedAnimation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            DelayedAnimation(
                delay: 1000,
                child: Container(
                  margin: EdgeInsets.all(50),
                  height: 300,
                  child: Image.asset('assets/images/login.png'),
                )
            ),
            DelayedAnimation(
                delay: 1500,
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 40,
                    horizontal: 30,
                  ),
                  child: Column(
                    children: [
                      Text("Pret a faire vos Demandes",
                      style: GoogleFonts.poppins(
                        color: PrimaryTextHeading,
                        fontSize: 24,
                        fontWeight: FontWeight.w600
                      ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Pour acceder a vos demandes merci de vous connecter",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            color: Colors.black54,
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                )
            ),
            DelayedAnimation(
                delay: 2500,
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 40,
                  ),
                  child: Column(
                    children: [
                      ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            primary:  PrimaryButtonColor,
                            padding: EdgeInsets.all(13),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.login,
                              color: Colors.white,
                              size: 30,
                              ),
                              SizedBox(width: 10,),
                              Text("Se Connecter",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              )
                            ],
                          )
                      ),
                      SizedBox(height: 10),
                      Text("OU"),
                      SizedBox(height: 10),
                      ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            primary:  PrimaryButtonColor,
                            padding: EdgeInsets.all(13),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.person_add_alt,
                                color: Colors.white,
                                size: 30,
                              ),
                              SizedBox(width: 10,),
                              Text("S'inscrire",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),

                      ),
                    ],
                  ),
                ))

          ],
        ),
      ),
    );
      
  }
}
