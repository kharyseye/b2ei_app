import 'package:b2ei_app/constant.dart';
import 'package:b2ei_app/pages/employee_interface/Dashboard.dart';
import 'package:b2ei_app/pages/introScreen/HomePage.dart';
import 'package:b2ei_app/pages/superior_interface/Dashboard_Sup.dart';
import 'package:b2ei_app/pages/welcome/WelcomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Authentification',
      theme: ThemeData(
        //primaryColor: PrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        colorSchemeSeed: Colors.green
      ),
      routes: {
        "home": (context) => HomePage(),
        "/Dashboard":(context) => Dashboard(),
        "/Dashboard_Sup":(context) => Dashboard_Sup(),
        '/WelcomePage': (context) => WelcomePage(),
      },
      home: WelcomePage(),
    );
  }
}

