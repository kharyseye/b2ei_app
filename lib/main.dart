import 'package:b2ei_app/pages/authentication/LoginPage.dart';
import 'package:b2ei_app/pages/employee_interface/Dashboard.dart';
import 'package:b2ei_app/pages/superior_interface/Dashboard_Sup.dart';
import 'package:b2ei_app/pages/superior_interface/add_user.dart';
import 'package:b2ei_app/pages/welcome/WelcomePage.dart';
import 'package:b2ei_app/services/auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Authentification',
      theme: ThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.white,
          useMaterial3: true,
          colorSchemeSeed: Colors.green),
      routes: {
       // "home": (context) => HomePage(),
        "/Dashboard": (context) => Dashboard(),
        "/Dashboard_Sup": (context) => Dashboard_Sup(),
        "/login": (context) => LoginPage(),
        '/WelcomePage': (context) => WelcomePage(authState: authState),
        '/AddUserPage': (context) => AddUserPage(),
      },
      home: WelcomePage(authState: authState),
    );
  }
}
