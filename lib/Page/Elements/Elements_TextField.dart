import 'package:flutter/material.dart';

Widget TextField_MAIL({required TextEditingController controller}) {
  return SizedBox(
    width: 500,
    child: TextField(
      obscureText: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Почта',
        //helperText: '',
        hintText: 'IvanovII@mail.ru',
      ),
    ),
  );
} // mail

Widget TextField_NAME() {
  return SizedBox(
    width: 500,
    child: TextField(
      obscureText: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Имя',
        //helperText: '',
        hintText: 'Иванов Иван',
      ),
    ),
  );
} // name

Widget TextField_PASSWORD({required TextEditingController controller}) {
  return SizedBox(
    width: 500,
    child: TextField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Пароль',
      ),
    ),
  );
} // passsword
