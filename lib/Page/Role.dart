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
  @override
  void initState() {
    super.initState();
    dbusers();
  }

  void dbusers() async {
    var ref = FirebaseDatabase.instance.ref('users');
    DatabaseEvent event = await ref.once();
    Map<dynamic, dynamic> data_db =
        event.snapshot.value as Map<dynamic, dynamic>;
    data_db.forEach((key, value) {
      userName = key;
      Map<dynamic, dynamic> data = value as Map;
    });
  }

  String userName = '';
  final user = FirebaseAuth.instance.currentUser!;
  Query dbRef = FirebaseDatabase.instance.ref().child('users');

  Widget listItem() {
    return Container(
      height: 60,
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
                    Text_medium_16_Black(Text_name: userName),
                    Text_reqular_13_Black(Text_name: ''),
                  ],
                ),
                // DropdownButtonFormField(items: , onChanged: (value) {

                // },)
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
                                    print(UserDataMain['privilege']);
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text_medium_18_Black(Text_name: 'ФИЛЬТР')],
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
                            return listItem();
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