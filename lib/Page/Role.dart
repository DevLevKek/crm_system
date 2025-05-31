import 'dart:math';

import 'package:crm_system/Page/Firebase/databaseUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'Elements/Elements.dart';

class Role extends StatefulWidget {
  const Role({super.key});

  @override
  State<Role> createState() => _Role();
}

class _Role extends State<Role> {
  List<String> data_db_a = []; // Application_template_departament
  List<String> data_db_au = []; //
  List<String> data_db_u = []; // users

  @override
  void initState() {
    super.initState();
    dApplication_template_departament();
    dUsers();
    dApplication_template_departament_USER();
  }

  dUsers() async {
    var refAT = FirebaseDatabase.instance.ref('users');
    DatabaseEvent event = await refAT.once();
    Map<dynamic, dynamic> data_db = event.snapshot.value as Map;
    List<String> dt = [];
    data_db.forEach((key, value) {
      Map<dynamic, dynamic> dd = value as Map<dynamic, dynamic>;
      dd.forEach((key, value) {
        if (key == 'privilege') {
          dt.add(value.toString());
        }
      });
    });
    setState(() {
      data_db_u = dt;
    });
  }

  dApplication_template_departament() async {
    var refAT = FirebaseDatabase.instance.ref(
      'Application_template_departament',
    );
    DatabaseEvent event = await refAT.once();
    Map<dynamic, dynamic> data_db = event.snapshot.value as Map;
    List<String> dt = ['-'];
    data_db.forEach((key, value) => dt.add(key.toString()));
    setState(() {
      data_db_a = dt;
    });
  }

  dApplication_template_departament_USER() async {
    var refAT = FirebaseDatabase.instance.ref('users');
    DatabaseEvent event = await refAT.once();
    Map<dynamic, dynamic> data_db = event.snapshot.value as Map;
    List<String> dt = [];
    bool privilegeUser = false;
    data_db.forEach((key, value) {
      Map<dynamic, dynamic> data = value as Map<dynamic, dynamic>;
      data.forEach((key, value) {
        if (key == 'deportament') {
          dt.add(value.toString());
        }
      });
    });
    setState(() {});
    data_db_au = dt;
  }

  List<String> dropdownValueUser = ['user', 'executor', 'admin'];
  String? dropdownValueDeportment;
  String userName = '';
  final user = FirebaseAuth.instance.currentUser?.email!;
  Query dbRef = FirebaseDatabase.instance.ref().child('users');
  String dropdownValue = '';
  Widget listItem(Map dt, String nameuser, int index) {
    return Container(
      height: 70,
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text_medium_16_Black(Text_name: nameuser),
                    Text_reqular_13_Black(Text_name: dt['name']),
                  ],
                ),

                DropdownButton<String>(
                  value: data_db_au[index],
                  items:
                      data_db_a.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),

                  onChanged: (value) async {
                    var ref = FirebaseDatabase.instance.ref('users');
                    DatabaseEvent event = await ref.once();
                    Map<dynamic, dynamic> data_db = event.snapshot.value as Map;

                    //Временные переменные
                    bool privilege_user = false;
                    //
                    data_db.forEach((key, value) {
                      if (nameuser == key) {
                        Map<dynamic, dynamic> data_db_value = value as Map;
                        data_db_value.forEach((key, value) {
                          if (key == 'privilege' && value == 'executor') {
                            privilege_user = true;
                          } else {
                            privilege_user = false;
                          }
                        });
                      }
                    });
                    if (privilege_user) {
                      setState(() {
                        data_db_au[index] = value.toString();
                      });
                      ref.child(nameuser).update({
                        'deportament': data_db_au[index],
                      });
                      privilege_user = false;
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Color.fromARGB(255, 243, 3, 3),
                          content: Text(
                            'Нельзя менять отдел для "user"/"admin"',
                          ),
                        ),
                      );
                    }
                  },
                ),
                DropdownButton<String>(
                  items:
                      <String>[
                        'user',
                        'executor',
                        'admin',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                  value: data_db_u[index],
                  onChanged: (newValue) {
                    data_db_u[index] = newValue.toString();
                    DatabaseReference ref = FirebaseDatabase.instance.ref(
                      'users',
                    );
                    setState(() {
                      ref.child(nameuser).update({
                        'privilege': newValue.toString(),
                      });
                      if (newValue == 'user' || newValue == 'admin') {
                        ref.child(nameuser).update({
                          'deportament': data_db_a[0],
                        });
                        data_db_au[index] = data_db_a[0];
                      }
                    });
                  },
                ),
              ],
            ),
          ),
          Divider(color: Color.fromARGB(55, 0, 0, 0)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          //ЛЕВЫЙ БЛОК
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BD_No_borderRadius(),
                    //width: 400,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(child: Text_bold_24(Text_name: "CRM")),
                                SizedBox(height: 4),
                                Divider(color: Color.fromARGB(55, 0, 0, 0)),
                                SizedBox(height: 8),
                                ElevatedButton.icon(
                                  icon: Icon(
                                    Icons.content_paste,
                                    size: 25,
                                    color: Color.fromARGB(255, 47, 43, 61),
                                  ),
                                  style: ButtonStyle(
                                    minimumSize: WidgetStatePropertyAll(
                                      const Size(100, 40),
                                    ),

                                    shadowColor: WidgetStatePropertyAll<Color>(
                                      Color.fromARGB(0, 255, 225, 227),
                                    ),
                                    shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    backgroundColor:
                                        WidgetStatePropertyAll<Color>(
                                          Color.fromARGB(255, 255, 255, 255),
                                        ),
                                  ),
                                  label: Text_medium_16_Black(
                                    Text_name: 'Заявки',
                                  ),
                                  onPressed: () async {
                                    UpdateDB updateDB = UpdateDB();
                                    await updateDB.UpdateUserData();
                                    Navigator.pushReplacementNamed(
                                      context,
                                      '/HomePage',
                                    );
                                  },
                                ),
                                SizedBox(height: 8),
                                ElevatedButton.icon(
                                  icon: Icon(
                                    Icons.person_outline,
                                    size: 25,
                                    color: Color.fromARGB(255, 47, 43, 61),
                                  ),
                                  style: ButtonStyle(
                                    minimumSize: WidgetStatePropertyAll(
                                      const Size(100, 40),
                                    ),

                                    shadowColor: WidgetStatePropertyAll<Color>(
                                      Color.fromARGB(0, 255, 225, 227),
                                    ),
                                    shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    backgroundColor:
                                        WidgetStatePropertyAll<Color>(
                                          Color.fromARGB(255, 255, 255, 255),
                                        ),
                                  ),
                                  label: Text_medium_16_Black(
                                    Text_name: 'Роли',
                                  ),
                                  onPressed: () async {
                                    UpdateDB updateDB = UpdateDB();
                                    await updateDB.UpdateUserData();
                                    print(UserDataMain['privilege']);
                                    Navigator.pushReplacementNamed(
                                      context,
                                      '/Role',
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton.icon(
                            icon: Icon(
                              Icons.exit_to_app,
                              color: Color.fromARGB(255, 255, 76, 82),
                            ),
                            style: ButtonStyle(
                              shadowColor: WidgetStatePropertyAll<Color>(
                                Color.fromARGB(0, 255, 225, 227),
                              ),
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              backgroundColor: WidgetStatePropertyAll<Color>(
                                Color.fromARGB(255, 255, 225, 227),
                              ),
                            ),
                            onPressed: () {
                              FirebaseAuth.instance.signOut();
                              UserDataMain['name'] = '';
                              UserDataMain['email'] = '';
                              UserDataMain['privilege'] = '';
                              print(UserDataMain);
                              Navigator.pushNamed(context, '/');
                            },
                            label: Text(
                              'Выйти из аккаунта',
                              style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 15,
                                fontFamily: 'Public Sans',
                                color: Color.fromARGB(255, 255, 76, 82),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //СРЕДНИЙ БЛОК
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 24,
                left: 24,
                right: 12,
                top: 24,
              ),
              child: Container(
                decoration: BD_borderRadius(),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text_medium_18_Black(Text_name: 'Роли пользователей'),
                        ],
                      ),
                      SizedBox(height: 12),
                      Divider(color: Color.fromARGB(55, 0, 0, 0)),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24.0,
                          vertical: 4,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text_medium_16_Black(Text_name: 'Имя'),
                            Text_medium_16_Black(Text_name: 'Отдел'),
                            Text_medium_16_Black(Text_name: 'Роль'),
                          ],
                        ),
                      ),
                      Divider(color: Color.fromARGB(82, 0, 0, 0)),
                      Expanded(
                        child: FirebaseAnimatedList(
                          query: dbRef,
                          itemBuilder: (
                            BuildContext context,
                            DataSnapshot snapshot,
                            Animation<double> animation,
                            int index,
                          ) {
                            Map dt = snapshot.value as Map;
                            String nameuser = snapshot.key as String;
                            return listItem(dt, nameuser, index);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //ПРАВЫЙ БЛОК
          // Expanded(
          //   flex: 3,
          //   child: Padding(
          //     padding: const EdgeInsets.only(
          //       bottom: 24,
          //       left: 12,
          //       right: 24,
          //       top: 24,
          //     ),
          //     child: Container(decoration: BD_borderRadius()),
          //   ),
          // ),
        ],
      ),
    );
  }
}
//  Widget _viewType() {
//     return new DropdownButton(items: , onChanged: onChanged)}