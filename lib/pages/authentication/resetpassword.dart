import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constant.dart';
import '../../services/reset_password.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _currentPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Changer le mot de passe'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Bienvenue !",
                  style: GoogleFonts.poppins(
                    color: PrimaryButtonColor,
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Changer votre mot de passe en toute sécurité",
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
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez saisir votre email.';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Vos autres champs TextFormField...
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
                  child: TextFormField(
                    controller: _currentPasswordController,
                    decoration: InputDecoration(
                      labelText: "Mot de passe actuel",
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.lock),
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
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez saisir votre mot de passe actuel.';
                      }
                      return null;
                    },
                  ),
                ),
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
                  child: TextFormField(
                    controller: _newPasswordController,
                    decoration: InputDecoration(
                      labelText: "Nouveau mot de passe",
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.lock),
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
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez saisir votre nouveau mot de passe.';
                      }
                      return null;
                    },
                  ),
                ),

                SizedBox(height: 50),
                AnimatedButton(
                  text: 'Changer mon mot de passe',
                  buttonTextStyle: TextStyle(fontSize: 20, color: Colors.white),
                  color: Colors.green,
                  pressEvent: () async {
                    if (_formKey.currentState!.validate()) {
                      // Vérifier si l'email correspond à l'utilisateur connecté
                      User? user = FirebaseAuth.instance.currentUser;
                      if (_emailController.text.trim() != user?.email) {
                        // Afficher une erreur si l'email ne correspond pas
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                "Cet email ne correspond pas à votre compte."),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }

                      // Appeler la fonction de changement de mot de passe
                      changePassword(
                        _emailController.text.trim(),
                        _currentPasswordController.text.trim(),
                        _newPasswordController.text.trim(),
                      );
                      // Afficher le dialogue de succès
                      // ...
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
