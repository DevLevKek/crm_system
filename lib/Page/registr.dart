import 'package:crm_system/Page/Elements/Elements.dart';
import 'package:crm_system/Page/Firebase/Firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'Firebase/databaseUser.dart';

class Registr extends StatefulWidget {
  const Registr({super.key});

  @override
  State<Registr> createState() => _RegistrState();
}

class _RegistrState extends State<Registr> {
  FirebaseAuthService _auth = FirebaseAuthService();
  @override
  bool _isButtonEnabled = false;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailnameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FirebaseDatabase database = FirebaseDatabase.instance;

  void initState() {
    super.initState();
    _emailnameController.addListener(_updateButtonState);
    _passwordController.addListener(_updateButtonState);
    _usernameController.addListener(
      _updateButtonState,
    ); // проверяет изменение. Если есть изменения, то выполняет функци. _updateButtonState
  }

  void _updateButtonState() {
    setState(() {
      if (_usernameController.text.isNotEmpty &
          _passwordController.text.isNotEmpty &
          _emailnameController.text.isNotEmpty) {
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
            height: 480,
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
                Text_bold_24(Text_name: 'Регистрация'),
                SizedBox(height: 32),

                TextField(
                  obscureText: false,
                  controller: _usernameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Имя',
                    //helperText: '',
                    hintText: 'Лев',
                  ),
                ),

                SizedBox(height: 12),
                //TextField_MAIL(controller: _emailrnameController),
                TextField(
                  obscureText: false,
                  controller: _emailnameController,
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
                    backgroundColor:
                        _isButtonEnabled
                            ? WidgetStatePropertyAll<Color>(
                              Color.fromARGB(255, 114, 103, 240),
                            )
                            : WidgetStatePropertyAll<Color>(
                              Color.fromARGB(255, 215, 212, 248),
                            ),
                  ),

                  onPressed:
                      _isButtonEnabled
                          ? () async {
                            String mail = _emailnameController.text.trim();
                            String pass = _passwordController.text.trim();
                            String name = _usernameController.text.trim();
                            //String name = _usernameController.text.trim();
                            User? user = await _auth.signUpWithEmailAndPassword(
                              mail,
                              pass,
                            );
                            if (name.contains(
                                  RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
                                ) ==
                                false) {
                              if (user != null) {
                                UserDataMain['name'] = name;
                                UserDataMain['email'] = mail;
                                UserDataMain['privilege'] = 'user';
                                print(UserDataMain);
                                Map<String, String> userdata = {
                                  'name': name,
                                  'privilege': 'user',
                                };
                                DatabaseReference ref = FirebaseDatabase
                                    .instance
                                    .ref('users');
                                ref
                                    .child(mail.replaceAll('.', '_'))
                                    .set(userdata);

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
                                      'Добро пожаловать! "' + mail + '"',
                                    ),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Такая учетная запись уже есть',
                                    ),
                                  ),
                                );
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Логин не должен содержать специальные символы("!", "_", "@", "#" и т.д.)',
                                  ),
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
                    child: Text_medium_16_White(
                      Text_name: 'Зарегистрироваться',
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text_reqular_13_Black(Text_name: 'Есть учетная запись ?'),
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
    _emailnameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
