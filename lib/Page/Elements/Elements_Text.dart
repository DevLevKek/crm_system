import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//TEXT
Widget Text_medium_16_Black({required String Text_name}) {
  return Text(
    Text_name,
    style: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      fontFamily: 'Public Sans',
      color: Color.fromARGB(255, 47, 43, 61),
    ),
  );
} // main Text

Widget Text_medium_16_White({required String Text_name}) {
  return Text(
    Text_name,
    style: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      fontFamily: 'Public Sans',
      color: Color.fromARGB(255, 255, 255, 255),
    ),
  );
} // main Text

Widget Text_reqular_15({required String Text_name}) {
  return Text(
    Text_name,
    style: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 15,
      fontFamily: 'Public Sans',
      color: Color.fromARGB(174, 47, 43, 61),
    ),
  );
} // second Text

Widget Text_reqular_13_Black({required String Text_name}) {
  return Text(
    Text_name,
    style: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 13,
      fontFamily: 'Public Sans',
      color: Color.fromARGB(174, 47, 43, 61),
    ),
  );
} // second(2) Text
// ignore: non_constant_identifier_names
Widget Text_reqular_13_Purple({required String Text_name}) {
  return Text(
    Text_name,
    style: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 13,
      fontFamily: 'Public Sans',
      color: Color.fromARGB(255, 114, 103, 240),
    ),
  );
} // second(2) Text
// ignore: non_constant_identifier_names
Widget Text_bold_22({required String Text_name}) {
  return Text(
    Text_name,
    style: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 22,
      fontFamily: 'Public Sans',
      color: Color.fromARGB(255, 47, 43, 61),
    ),
  );
} // NAME CRM Text
// ignore: non_constant_identifier_names
Widget Text_bold_24({required String Text_name}) {
  return Text(
    Text_name,
    style: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 24,
      fontFamily: 'Public Sans',
      color: Color.fromARGB(255, 47, 43, 61),
    ),
  );
} // NAME Text

//------------------------------------------------------------------
// TEXT_STATUS
//------------------------------------------------------------------
// ignore: non_constant_identifier_names
Widget Text_STATUS_In_progress() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      color: Color.fromARGB(55, 114, 103, 240),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Text(
        'Выполняется',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
          fontFamily: 'Public Sans',
          color: Color.fromARGB(255, 115, 103, 240),
        ),
      ),
    ),
  );
} // Text Выполняется
// ignore: non_constant_identifier_names
Widget Text_STATUS_Waiting() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      color: Color.fromARGB(55, 255, 158, 67),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Text(
        'В ожидании',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
          fontFamily: 'Public Sans',
          color: Color.fromARGB(255, 255, 158, 67),
        ),
      ),
    ),
  );
} // Text В ожидании
// ignore: non_constant_identifier_names
Widget Text_STATUS_Solved() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      color: Color.fromARGB(55, 40, 199, 111),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Text(
        'Решено',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
          fontFamily: 'Public Sans',
          color: Color.fromARGB(255, 40, 199, 111),
        ),
      ),
    ),
  );
} // Text Решено
// ignore: non_constant_identifier_names
Widget Text_STATUS_No_Solved() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      color: Color.fromARGB(55, 255, 76, 81),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Text(
        'Нет решения',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
          fontFamily: 'Public Sans',
          color: Color.fromARGB(255, 255, 76, 82),
        ),
      ),
    ),
  );
} // Text Нет решения

//------------------------------------------------------------------
// TEXT_PRIORITET
//------------------------------------------------------------------
// ignore: non_constant_identifier_names
Widget Text_PRIORITET_critical() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromARGB(255, 255, 76, 82),
        ),
      ),
      SizedBox(width: 6),
      Text(
        'Критический',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
          fontFamily: 'Public Sans',
          color: Color.fromARGB(255, 255, 76, 82),
        ),
      ),
    ],
  );
} // Text В ожидании
// ignore: non_constant_identifier_names
Widget Text_PRIORITET_medium() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromARGB(255, 255, 158, 67),
        ),
      ),
      SizedBox(width: 6),
      Text(
        'Средний',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
          fontFamily: 'Public Sans',
          color: Color.fromARGB(255, 255, 158, 67),
        ),
      ),
    ],
  );
} // Text В ожидании
// ignore: non_constant_identifier_names
Widget Text_PRIORITET_easy() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromARGB(255, 40, 199, 111),
        ),
      ),
      SizedBox(width: 6),
      Text(
        'Низкий',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
          fontFamily: 'Public Sans',
          color: Color.fromARGB(255, 40, 199, 111),
        ),
      ),
    ],
  );
} // Text В ожидании

//------------------------------------------------------------------
// TEXT_ROLE
//------------------------------------------------------------------
// ignore: non_constant_identifier_names
Widget Text_ROLE_User() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      color: Color.fromARGB(55, 114, 103, 240),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Text(
        'Пользователь',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
          fontFamily: 'Public Sans',
          color: Color.fromARGB(255, 115, 103, 240),
        ),
      ),
    ),
  );
} // Text Выполняется
// ignore: non_constant_identifier_names
Widget Text_ROLE_Admin() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      color: Color.fromARGB(55, 255, 158, 67),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Text(
        'Админ',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
          fontFamily: 'Public Sans',
          color: Color.fromARGB(255, 255, 158, 67),
        ),
      ),
    ),
  );
} // Text В ожидании
// ignore: non_constant_identifier_names
Widget Text_ROLE_Moder() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      color: Color.fromARGB(55, 40, 199, 111),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Text(
        'Модератор',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
          fontFamily: 'Public Sans',
          color: Color.fromARGB(255, 40, 199, 111),
        ),
      ),
    ),
  );
} // Text Решено

//BUTTON

//TEXT_FIELD
Widget buildTextField({
  required TextEditingController controller,
  required String hintText,
  required IconData icon,
  bool obscureText = false,
}) {
  return TextField(
    controller: controller,
    obscureText: obscureText,
    style: const TextStyle(color: Colors.white),
    decoration: InputDecoration(
      filled: true,
      fillColor: const Color.fromARGB(255, 35, 38, 39), // Тёмно-серый фон поля
      hintText: hintText,
      hintStyle: const TextStyle(
        color: Color.fromARGB(255, 108, 114, 117),
        fontSize: 20,
        fontWeight: FontWeight.w200,
      ),
      // ignore: prefer_const_constructors
      prefixIcon: Icon(icon, color: Color.fromARGB(255, 108, 114, 117)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
