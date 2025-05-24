import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class TestFunc extends StatefulWidget {
  const TestFunc({super.key});

  @override
  State<TestFunc> createState() => _TestFuncState();
}

class _TestFuncState extends State<TestFunc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 100,
          width: 200,
          child: ElevatedButton(
            onPressed: () {
              print('object');
              String mail = 'Lev@mail.ru';
              String name = 'Lev1';
              Map<String, String> userdata = {'name': name, 'privilege': 'user'};
          
              DatabaseReference ref = FirebaseDatabase.instance.ref('user');
              ref.child(mail.replaceAll('.', '_')).set(userdata);
            },
            child: Text('Test'),
          ),
        ),
      ),
    );
  }
}
