import 'package:flutter/material.dart';

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
                children: [Text("ВХОД"), SizedBox(height: 20), Text('email')],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildTextField({
  required TextEditingController controller,
  required String hintText,
  required IconData icon,
  bool obscureText = false,
}) {
  return TextField(
    controller: controller,
    obscureText: obscureText,
    // style: .roboto(color: Colors.white, fontWeight: FontWeight.w100),
    decoration: InputDecoration(
      filled: true,
      fillColor: const Color.fromARGB(255, 35, 38, 39), // Тёмно-серый фон поля
      hintText: hintText,
      hintStyle: const TextStyle(
        color: Color.fromARGB(255, 108, 114, 117),
        fontSize: 20,
        fontWeight: FontWeight.w200,
      ),
      prefixIcon: Icon(icon, color: Color.fromARGB(255, 108, 114, 117)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
