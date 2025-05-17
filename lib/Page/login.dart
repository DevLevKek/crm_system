import 'package:crm_system/Page/Elements/Elements_Button.dart';
import 'package:flutter/material.dart';
import 'Elements/Elements_Text.dart';
import 'Elements/Elements_TextField.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Center(child: Text('data'))),
      body: Container(
        color: Color.fromARGB(255, 248, 247, 250),
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 24),
            height: 440,
            width: 460,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(52, 47, 43, 61),
                  blurRadius: 20,
                  //offset: Offset(0, 0),
                ),
              ],
            ),
            child: Column(
              children: [
                Text_bold_24(Text_name: 'Вход'),
                SizedBox(height: 32),
                TextField_MAIL(),
                SizedBox(height: 12),
                TextField_PASSWORD(controller: TextEditingController()),
                SizedBox(height: 32),
                Button_Login_Disbale(),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    Text_reqular_13_Black(Text_name: 'Нет учетной записи ? '),
                    Button_Text_Rergistr(context),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
