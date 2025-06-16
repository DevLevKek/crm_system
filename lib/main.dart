import 'package:crm_system/Page/Application%20template/Application_Template.dart';
import 'package:crm_system/Page/Application%20template/Application_Template_Create_Theme.dart';
import 'package:crm_system/Page/Application%20template/Application_Template_Create_department.dart';
import 'package:crm_system/Page/Application%20template/Application_Template_Update_Department.dart';
import 'package:crm_system/Page/Application%20template/Application_Template_Update_Theme.dart';
import 'package:crm_system/Page/Application.dart';
import 'package:crm_system/Page/Applications.dart';
import 'package:crm_system/Page/Role.dart';
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
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => Login(),
        '/registr': (BuildContext context) => Registr(),
        '/HomePage': (BuildContext context) => HomePage(),
        '/HomePage/Application': (BuildContext context) => Application(),
        '/HomePage/ApplicationTemplate':
            (BuildContext context) => ApplicationTemplate(),
        '/HomePage/ApplicationTemplate/CreateDepartment':
            (BuildContext context) => ApplicationTemplateCreateDepartment(),
        '/HomePage/ApplicationTemplate/CreateDepartment/Theme':
            (BuildContext context) => ApplicationTemplateCreateTheme(),
        '/HomePage/ApplicationTemplate/UpdateDepartment':
            (BuildContext context) => ApplicationTemplateUpdateDepartment(),
        '/HomePage/ApplicationTemplate/UpdateDepartment/Theme':
            (BuildContext context) => ApplicationTemplateUpdateTheme(),
        '/HomePage/Applications': (BuildContext context) => Applications(),
        '/Role': (BuildContext context) => Role(),
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
