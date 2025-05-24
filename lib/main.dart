import 'package:crm_system/Page/home_page.dart';
import 'package:crm_system/Page/registr.dart';
import 'package:crm_system/Test_func.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'Page/login.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MaterialApp(
      title: 'CRM',

      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => Login(),
        '/registr': (BuildContext context) => Registr(),
        '/HomePage': (BuildContext context) => HomePage(),
        '/TestPage': (BuildContext context) => TestFunc(), 
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Login();
  }
}
