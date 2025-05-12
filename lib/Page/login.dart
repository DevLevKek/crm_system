import 'package:flutter/material.dart';
import 'Elements/Elements_Text.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRM',
      home: Scaffold(
        //appBar: AppBar(title: Center(child: Text('data'))),
        body: Container(
          color: Color.fromARGB(255, 248, 247, 250),
          child: Center(
            child: Container(
              height: 440,
              width: 460,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  Text_medium_16(Text_name: 'Дата начало'),
                  Text_reqular_15(Text_name: 'Text_name'),
                  Text_bold_22(Text_name: 'Text_name'),
                  Text_PRIORITET_medium(),
                  Text_PRIORITET_easy(),
                  Text_PRIORITET_critical(),
                  Text_ROLE_Admin(),
                  Text_ROLE_Moder(),
                  Text_ROLE_User()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
