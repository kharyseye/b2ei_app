import 'package:b2ei_app/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toastification/toastification.dart';
import '../../constant.dart';
import '../../services/user_preferences.dart';
import '../welcome/DelayedAnimation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final UserPreferences userPref = UserPreferences();

  String? _email;
  String? _password;

  bool _isVisible = true;
  bool _isloading = false;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    final disabled =
        _email == null || _email == '' || _password == null || _password == '';

    return Scaffold(
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: w,
              height: h * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/ban4.jpg"),
                      fit: BoxFit.cover)),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bonjour",
                    style: GoogleFonts.poppins(
                      color: PrimaryButtonColor,
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Connectez-vous a votre compte",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
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
                          ]),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Adresse email",
                          hintText: "Entrez votre adresse email",
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(Icons.email),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          setState(() {
                            _email = value;
                          });
                        },
                      )),
                  SizedBox(
                    height: 20,
                  ),
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
                        ]),
                    child: TextField(
                      obscureText: _isVisible,
                      decoration: InputDecoration(
                        labelText: "Mot de passe",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(_isVisible
                              ? CupertinoIcons.eye
                              : CupertinoIcons.eye_slash),
                          onPressed: () {
                            setState(() {
                              _isVisible = !_isVisible;
                            });
                          },
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _password = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(),
                      ),
                      Text(
                        "Mot de passe oublié ?",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  DelayedAnimation(
                      delay: 1000,
                      child: Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: PrimaryColor,
                              shape: StadiumBorder(),
                              padding: EdgeInsets.all(13)),
                          child: _isloading
                              ? showLoading()
                              : Text(
                                  "CONNEXION",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                          onPressed: _isloading || disabled
                              ? null
                              : () {
                                  if (disabled) return;
                                  setState(
                                    () {
                                      _isloading = true;
                                    },
                                  );
                                  FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                    email: _email ?? '',
                                    password: _password ?? '',
                                  )
                                      .then((data) async {
                                    final user = data.user;
                                    if (user != null) {
                                      final uid = user.uid;
                                      // Récupérer le document employé
                                      try {
                                        final employeRef = FirebaseFirestore
                                            .instance
                                            .collection('users')
                                            .where('uid', isEqualTo: uid);
                                        final employeQuerySnapshot =
                                            await employeRef.get();

                                        if (employeQuerySnapshot
                                            .docs.isNotEmpty) {
                                          final employeDoc =
                                              employeQuerySnapshot.docs.single;
                                          debugPrint('${employeDoc.data()}');

                                          final employeData = employeDoc.data();
                                          final isSuperviseur = employeData[
                                                  'supervisor'] ??
                                              false; // Default to false if 'supervisor' field is null
                                          final isActive =
                                              employeData['isActive'] ?? true;

                                          // Share preferences
                                          await userPref.saveUserId('$uid');
                                          await userPref
                                              .saveSupervisor(isSuperviseur);

                                          if (!isActive) {
                                            setState(
                                              () {
                                                _isloading = false;
                                              },
                                            );
                                            return showToast(
                                              context,
                                              backgroundColor: Colors.pink,
                                              title: Text('Compte inactif 😱',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                  )),
                                              description: Text(
                                                  "votre compte est inactif, veuillez contacter le support !",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                  )),
                                              alignment: Alignment.bottomCenter,
                                              type: ToastificationType.error,
                                              style: ToastificationStyle.flat,
                                            );
                                          }

                                          // Navigate user
                                          if (isSuperviseur) {
                                            Navigator.of(context)
                                                .pushReplacementNamed(
                                                    '/Dashboard_Sup');
                                          } else {
                                            Navigator.of(context)
                                                .pushReplacementNamed(
                                                    '/Dashboard');
                                          }
                                        } else {
                                          debugPrint(
                                              "No document found for UID: $uid");
                                          setState(
                                            () {
                                              _isloading = false;
                                            },
                                          );
                                          // Handle case where no document is found for the UID
                                          showToast(
                                            context,
                                            backgroundColor: Colors.pink,
                                            title: Text('Erreur 😭',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                )),
                                            description:
                                                Text("Utilisateurs introuvable",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                    )),
                                            alignment: Alignment.bottomCenter,
                                            type: ToastificationType.error,
                                            style: ToastificationStyle.flat,
                                          );
                                        }
                                      } catch (e) {
                                        setState(
                                          () {
                                            _isloading = false;
                                          },
                                        );
                                        // print(
                                        //     "Une erreur s'est produite lors de la récupération des données : $e");
                                        showToast(
                                          context,
                                          backgroundColor: Colors.pink,
                                          title: Text('Erreur 😭',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                              )),
                                          description: Text(
                                              "Une erreur s'est produite lors de la récupération des données : $e",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                              )),
                                          alignment: Alignment.bottomCenter,
                                          type: ToastificationType.error,
                                          style: ToastificationStyle.flat,
                                        );
                                      }
                                      ;
                                    }
                                  }).catchError((e) {
                                    showToast(
                                      context,
                                      backgroundColor: Colors.pink,
                                      title: Text('Erreur :',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          )),
                                      description: Text(
                                          'Email ou mot de passe incorrect !',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          )),
                                      alignment: Alignment.bottomCenter,
                                      type: ToastificationType.error,
                                      style: ToastificationStyle.flat,
                                    );
                                    setState(
                                      () {
                                        _isloading = false;
                                      },
                                    );
                                  });
                                },
                        ),
                      )),
                  SizedBox(
                    height: w * 0.1,
                  ),
                  /* Center(
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
                      )*/
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
