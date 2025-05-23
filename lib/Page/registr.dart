import 'package:crm_system/Page/Elements/Elements_Button.dart';
import 'package:crm_system/Page/Elements/Elements_Text.dart';
import 'package:crm_system/Page/Elements/Elements_TextField.dart';
import 'package:crm_system/Page/Firebase/Firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Registr extends StatefulWidget {
  const Registr({super.key});

  @override
  State<Registr> createState() => _RegistrState();
}

class _RegistrState extends State<Registr> {
  //final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuthService _auth = FirebaseAuthService();
  
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailrnameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Center(child: Text('data'))),
      body: Container(
        color: Color.fromARGB(255, 248, 247, 250),
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 24),
            height: 480,
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
                Text_bold_24(Text_name: 'Регистрация'),
                SizedBox(height: 32),
                TextField_NAME(),
                SizedBox(height: 12),
                //TextField_MAIL(controller: _emailrnameController),
                TextField(
                  obscureText: false,
                  controller: _emailrnameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Почта',
                    //helperText: '',
                    hintText: 'IvanovII@mail.ru',
                  ),
                ),
                SizedBox(height: 12),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Пароль',
                  ),
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: WidgetStatePropertyAll(const Size(1000, 0)),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    backgroundColor: WidgetStatePropertyAll<Color>(
                      Color.fromARGB(255, 114, 103, 240),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    child: Text_medium_16_White(Text_name: 'Register'),
                  ),
                  onPressed: () async {
                    String mail = _emailrnameController.text.trim();
                    String pass = _passwordController.text.trim();
                    User? user = await _auth.signUpWithEmailAndPassword(
                      mail,
                      pass,
                    );
                    if (user != null) {
                      Navigator.pushReplacementNamed(context, '/HomePage');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Добро пожаловать ! "' + mail + '"'),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Неверный почта/пароль')),
                      );
                    }
                  },
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text_reqular_13_Black(Text_name: 'Есть учетная запись ? '),
                    Button_Text_Login(context),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailrnameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
