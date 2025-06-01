import 'dart:math';
import 'package:crm_system/Page/Firebase/Firebase_auth.dart';
import 'package:crm_system/Page/Firebase/databaseUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'Elements/Elements.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  bool _isButtonEnabled = false;
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

  void initState() {
    super.initState();
    _emailController.addListener(_updateButtonState);
    _passwordController.addListener(_updateButtonState);
    // проверяет изменение. Если есть изменения, то выполняет функци. _updateButtonState
  }

  void _updateButtonState() {
    setState(() {
      if (_passwordController.text.isNotEmpty &
          _emailController.text.isNotEmpty) {
        _isButtonEnabled = true;
      } else {
        _isButtonEnabled = false;
      }
    });
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
              borderRadius: BorderRadius.circular(10),
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
                    backgroundColor:
                        _isButtonEnabled
                            ? WidgetStatePropertyAll<Color>(
                              Color.fromARGB(255, 114, 103, 240),
                            )
                            : WidgetStatePropertyAll<Color>(
                              Color.fromARGB(255, 215, 212, 248),
                            ),
                  ),
                  // onPressed
                  onPressed:
                      _isButtonEnabled
                          ? () async {
                            String mail = _emailController.text.trim();
                            String pass = _passwordController.text.trim();
                            User? user = await _auth.signInWithEmailAndPassword(
                              mail,
                              pass,
                            );
                            if (user != null) {
                              var ref = FirebaseDatabase.instance.ref('users');
                              DatabaseEvent event = await ref.once();
                              Map<dynamic, dynamic> data =
                                  event.snapshot.value as Map<dynamic, dynamic>;
                              data.forEach((key, value) {
                                if (key.toString() ==
                                    mail.toString().replaceAll('.', '_')) {
                                  Map<dynamic, dynamic> data_db =
                                      value as Map<dynamic, dynamic>;
                                  data_db.forEach((key, value) {
                                    UserDataMain["email"] = mail;
                                    if (key == 'name') {
                                      UserDataMain['name'] = value.toString();
                                    }
                                    if (key == 'privilege') {
                                      UserDataMain['privilege'] = value;
                                    }
                                  });
                                }
                                print(UserDataMain);
                              });

                              Navigator.pushReplacementNamed(
                                context,
                                '/HomePage',
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Color.fromARGB(
                                    255,
                                    5,
                                    158,
                                    51,
                                  ),
                                  content: Text(
                                    'Добро пожаловать ! "' + mail + '"',
                                  ),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Color.fromARGB(
                                    255,
                                    243,
                                    3,
                                    3,
                                  ),
                                  content: Text('Неправильные логин/пароль'),
                                ),
                              );
                            }
                          }
                          : null,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    child: Text_medium_16_White(Text_name: 'Войти'),
                  ),
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

