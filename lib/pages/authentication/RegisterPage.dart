
import 'package:b2ei_app/model/Users.dart';
import 'package:b2ei_app/services/usermanagement.dart';
import 'package:b2ei_app/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toastification/toastification.dart';
import '../../constant.dart';
import '../welcome/DelayedAnimation.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  String _department = 'Direction';

  late String _username;
  late String _email;
  late String _password;
  String? _supervisor = 'Employer';

  late String _confirmPassword;
  late String _type;

  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
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
                      image: AssetImage("assets/images/ban3.jpg"),
                      fit: BoxFit.cover)),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DelayedAnimation(
                      delay: 800,
                      child: Container(
                        //margin: EdgeInsets.all(50),
                        //height: 300,
                        child: Text(
                          "S'inscrire",
                          style: GoogleFonts.poppins(
                            color: PrimaryButtonColor,
                            fontSize: 60,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
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
                      decoration: InputDecoration(
                        labelText: "Prenom & Nom",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.person),
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

                      onChanged: (value){
                        _username = value;}),
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
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Email @b2ei-sarl.com",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.email),
                        /*suffixIcon: IconButton(
                          icon: Icon(Icons.remove_red_eye),
                          onPressed: (){},
                        ),*/
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
                          _email = value;
                      });
                      }),
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
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Mot de passe",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.remove_red_eye),
                          onPressed: () {},
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
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
                      }
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
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Confirmer le mot de passe",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.remove_red_eye),
                          onPressed: () {},
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
                          _confirmPassword = value;
                      });
                        }
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
                    margin: EdgeInsets.only(bottom: 10),
                    child: DropdownButtonFormField(
                      items: [
                        DropdownMenuItem(
                            value: 'Direction', child: Text("DIRECTION")),
                        DropdownMenuItem(
                            value: 'Operation', child: Text("OPERATION"))
                      ],
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.home),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0)),
                      ),

                      value: _department,
                      onChanged: (value) {
                        setState(() {
                          _department = value?? 'Direction';
                        });
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Radio(
                          value: "Employer",

                          groupValue: _supervisor,
                          onChanged: (value) {
                            setState(() {
                              _supervisor= value;
                            });
                          }),
                      Text(
                        "Employer",
                        style: GoogleFonts.poppins(
                            fontSize: 18, color: Colors.black),
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      Radio(
                          value: "Superieur",
                          groupValue: _supervisor,
                          onChanged: (value) {
                            setState(() {
                              _supervisor= value;
                            });
                          }),
                      Text(
                        "Superieur",
                        style: GoogleFonts.poppins(
                            fontSize: 18, color: Colors.black),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DelayedAnimation(
                      delay: 1000,
                      child: Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: PrimaryButtonColor,
                              shape: StadiumBorder(),
                              padding: EdgeInsets.all(13)),
                          child:
                          _isLoading ? CircularProgressIndicator(
                            color: Colors.white,
                          ):
                          Text("CONNEXION",
                            style: GoogleFonts.poppins(
                                color: Colors.white
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              _isLoading = true;
                            });
                            //debugPrint('supervisor: ${_supervisor != 'Employer'}');
                            FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                              email: _email,
                              password: _password,
                            ).then((signedInUser) {
                              final user = signedInUser.user;
                              UserManagement().storeNewUser(
                                  context, user: Users(
                                email: user?.email ?? '',
                                uid: user?.uid ?? '',
                                username: _username,
                                department: _department,
                                supervisor: _supervisor != 'Employer',
                              ));
                            })
                                .catchError((e) {
                              showToast(
                                context,
                                backgroundColor: Colors.pink,
                                title: Text('Erreur 😭', style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,)
                                ),
                                description: Text(
                                    'Oups une erreur est survenue !',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,)),
                                alignment: Alignment.center,
                                type: ToastificationType.error,
                                style: ToastificationStyle.flat,
                              );
                              setState(() {
                                _isLoading = false;
                              });
                            }
                            );
                          },
                      ),
                      ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
