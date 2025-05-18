// ignore: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Elements_Text.dart';



// ignore: non_constant_identifier_names
Widget Button_Text_Rergistr(BuildContext context) {
  return TextButton(
    onPressed: () {
      Navigator.pushNamed(context, '/registr');
    },
    style: ButtonStyle(),
    child: Text_reqular_13_Purple(Text_name: 'Зарегистрироваться'),
  );
}

// ignore: non_constant_identifier_names
Widget Button_Text_Login(BuildContext context) {
  return TextButton(
    onPressed: () {
      Navigator.pushNamed(context, '/');
    },
    style: ButtonStyle(),
    child: Text_reqular_13_Purple(Text_name: 'Войти'),
  );
}

// ignore: non_constant_identifier_names
Widget Button_Login_Enable({
  required TextEditingController emailController,
  required TextEditingController passwordController,
}) {
  return ElevatedButton(
    style: ButtonStyle(
      minimumSize: WidgetStatePropertyAll(const Size(1000, 0)),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      backgroundColor: WidgetStatePropertyAll<Color>(
        Color.fromARGB(255, 114, 103, 240),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Text_medium_16_White(Text_name: 'Войти'),
    ),
    // FUNC
    onPressed: () {
      
    },
  );
}

// ignore: non_constant_identifier_names
Widget Button_Login_Disbale() {
  return ElevatedButton(
    style: ButtonStyle(
      minimumSize: WidgetStatePropertyAll(const Size(1000, 0)),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      backgroundColor: WidgetStatePropertyAll<Color>(
        Color.fromARGB(255, 161, 155, 231),
      ),
    ),
    // FUNC
    onPressed: null,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Text_medium_16_White(Text_name: 'Войти'),
    ),
  );
}
