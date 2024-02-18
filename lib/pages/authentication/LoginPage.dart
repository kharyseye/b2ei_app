import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:b2ei_app/pages/authentication/RegisterPage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constant.dart';
import '../welcome/DelayedAnimation.dart';
import 'AuthenticationPage.dart';
import 'package:page_transition/page_transition.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return  Scaffold(

      /*
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white.withOpacity(0),
          leading: IconButton(
            icon: Icon(
              Icons.clear,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      */
        body:  SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: w,
                  height: h*0.3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/banniere.jpg"),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  width: w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Bonjour",
                      style: GoogleFonts.poppins(
                        color: PrimaryButtonColor,
                        fontSize: 60,
                        fontWeight: FontWeight.w500,
                      ),
                      ),
                      Text("Connectez-vous a votre compte",
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 50,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: Offset(1, 1),
                              color: Colors.grey.withOpacity(0.2),
                            )
                          ]
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Nom d'utilisateur",
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(Icons.person),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                              color: Colors.white,
                              width: 1.0
                            )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 1.0
                                )
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 7,
                                offset: Offset(1, 1),
                                color: Colors.grey.withOpacity(0.2),
                              )
                            ]
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Mot de passe",
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.remove_red_eye),
                              onPressed: (){},
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 1.0
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 1.0
                                )
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Expanded(child: Container(),),
                          Text("Mot de passe oublié ?",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40,),
                      DelayedAnimation(
                          delay: 1000,
                          child: Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: PrimaryButtonColor,
                                  shape: StadiumBorder(),
                                  padding: EdgeInsets.all(13)
                              ),
                              child: Text("CONNEXION",
                                style: GoogleFonts.poppins(
                                    color: Colors.white
                                ),
                              ),
                              onPressed: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AuthenticationPage(),
                                    )
                                );
                              },
                            ),
                          )
                      ),
                      SizedBox(height:w*0.1,),
                      Center(
                        child: RichText(
                            text: TextSpan(
                              text: "Pas de Compte ?",
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: Colors.grey[500]
                              ),
                              children: [
                                TextSpan(
                                text: " Creer",
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    color: Colors.black,
                                  fontWeight: FontWeight.bold
                                ),
                                  recognizer:
                                  TapGestureRecognizer()..onTap=()=>Get.to(()=> RegisterPage())
                              ),
                              ],
                            )
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
    );
  }
}
