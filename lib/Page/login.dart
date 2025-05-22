import 'package:crm_system/Page/Elements/Elements_Button.dart';
import 'package:crm_system/Page/Firebase/Firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Elements/Elements_Text.dart';
import 'Elements/Elements_TextField.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  // Future signIn() async {
  //   await FirebaseAuth.instance.signInWithEmailAndPassword(
  //     email: _emailController.text.trim(),
  //     password: _passwordController.text.trim(),
  //   );
  // }
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                TextField(
                  controller: _emailController,
                  obscureText: false,
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
                    child: Text_medium_16_White(Text_name: 'Войти'),
                  ),

                  // FUNC
                  onPressed: () async {
                    String mail = _emailController.text.trim();
                    String pass = _passwordController.text.trim();
                    User? user = await _auth.signInWithEmailAndPassword(
                      mail,
                      pass,
                    );
                    if (user != null) {
                      Navigator.pushReplacementNamed(context, '/HomePage');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Color.fromARGB(255, 5, 158, 51),
                          content: Text('Добро пожаловать ! "' + mail + '"'),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Color.fromARGB(255, 243, 3, 3),
                          content: Text('Неправильные логин/пароль'),
                        ),
                      );
                    }
                  },
                ),
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
