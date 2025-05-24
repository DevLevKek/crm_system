import 'package:crm_system/Page/Firebase/databaseUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Вошли' + user.email.toString()),
          ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              UserDataMain['name'] = '';
              UserDataMain['email'] = '';
              UserDataMain['privilege'] = '';
              print(UserDataMain);
              Navigator.pushNamed(context, '/');
            },
            child: Text('Выйти из аккаунта'),
          ),
        ],
      ),
    );
  }
}
