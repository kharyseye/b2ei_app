import 'package:b2ei_app/pages/dashboard/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constant.dart';
import '../welcome/DelayedAnimation.dart';
import 'AuthenticationPage.dart';

class RegisterPage extends StatefulWidget {

  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String groupValue = "Employer";
  String selectedServiceType = 'Direction';
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
                  DelayedAnimation(
                      delay: 800,
                      child: Container(
                        //margin: EdgeInsets.all(50),
                        //height: 300,
                        child: Text("S'inscrire",
                          style: GoogleFonts.poppins(
                            color: PrimaryButtonColor,
                            fontSize: 60,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
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
                        labelText: "Prenom & Nom",
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
                        labelText: "Email @b2ei-sarl.com",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.email),
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
                            borderRadius: BorderRadius.circular(10),
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
                        labelText: "Confirmer le mot de passe",
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
                    margin: EdgeInsets.only(bottom: 10),
                    child: DropdownButtonFormField(
                      items: [
                        DropdownMenuItem(value:'Direction' ,child: Text("DIRECTION")),
                        DropdownMenuItem(value:'Operation' ,child: Text("OPERATION"))
                      ],
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.home),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),

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
                      ),
                      value: selectedServiceType,
                      onChanged: (value){
                        setState(() {
                          selectedServiceType = value!;
                        });
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Radio(
                          value: "Employer",
                          groupValue: groupValue,
                          onChanged: (value){
                            setState(() {
                              groupValue = value!;
                            });
                          }
                      ),
                       Text("Employer",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.black
                        ),
                      ),
                      SizedBox(width: 60,),
                      Radio(
                          value: "Superieur",
                          groupValue: groupValue,
                          onChanged: (value){
                            setState(() {
                              groupValue = value!;
                            });
                          }
                      ),
                      Text("Superieur",
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: Colors.black
                        ),
                      )
                    ],

                  ),
                  SizedBox(height: 20,),
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
                                  builder: (context) => Dashboard(),
                                )
                            );
                          },
                        ),
                      )
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
