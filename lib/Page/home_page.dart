import 'package:crm_system/Page/Firebase/databaseUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'Elements/Elements.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectPriority = '';
  String nameDP = '';
  final _nameDPController = TextEditingController();
  final _descriptionDPController = TextEditingController();
  final _themeDPController = TextEditingController();

  void initState() {
    super.initState();
    UpdateDB updateDB = UpdateDB();
    updateDB.UpdateUserData();
    print(updateDB);
    _nameDPController.addListener(_updateButtonState);
    _descriptionDPController.addListener(_updateButtonState);
    // проверяет изменение. Если есть изменения, то выполняет функци. _updateButtonState
  }

  void _updateButtonState() {
    setState(() {
      if (_nameDPController.text.isNotEmpty &
          _descriptionDPController.text.isNotEmpty) {
        _isButtonEnabled = true;
      } else {
        _isButtonEnabled = false;
      }
    });
  }

  Query dbRef = FirebaseDatabase.instance.ref().child('applications');
  @override
  bool _isButtonEnabled = false;

  void dispose() {
    _nameDPController.dispose();
    _descriptionDPController.dispose();
    super.dispose();
  }

  Widget listItem(Map dt, String nameuser, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 2),
      child: Container(
        height: 50,
        color: const Color.fromARGB(255, 105, 105, 105),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(nameuser)),
            SizedBox(width: 10),
            Expanded(child: Text(dt['author'].toString())),
            SizedBox(width: 4),
            Expanded(child: Text(dt['author'].toString())),
            SizedBox(width: 4),
            Expanded(child: Text(dt['departament'].toString())),
            SizedBox(width: 4),
            Expanded(child: Text(dt['theme'].toString())),
            SizedBox(width: 4),
            Expanded(child: Text('Критический')),
            SizedBox(width: 4),
            Expanded(child: Text(dt['status'].toString())),
            SizedBox(width: 4),
            Expanded(child: Text(dt['time_create'].toString())),
          ],
        ),
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
          //------------------------------------------------------------------------------------------------------------------

          //------------------------------------------------------------------------------------------------------------------
          //ПРАВЫЙ БЛОК
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
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text_medium_18_Black(Text_name: 'Заявки'),
                          Row(
                            children: [
                              Visibility(
                                visible: UserDataMain['privilege'] == 'admin',
                                child: ElevatedButton(
                                  style: ButtonStyle(
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
                                          Color.fromARGB(255, 40, 199, 111),
                                        ),
                                  ),
                                  onPressed: () {
                                    //_dialogBuilder_Application_Template(context);
                                    Navigator.pushNamed(
                                      context,
                                      '/HomePage/ApplicationTemplate',
                                    );
                                  },
                                  child: Text_medium_16_White(
                                    Text_name: 'Шаблоны заявок',
                                  ),
                                ),
                              ),
                              SizedBox(width: 12),
                              Visibility(
                                visible:
                                    UserDataMain['privilege'] == 'user' ||
                                    UserDataMain['privilege'] == 'admin',
                                child: ElevatedButton(
                                  style: ButtonStyle(
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
                                          Color.fromARGB(255, 40, 199, 111),
                                        ),
                                  ),
                                  onPressed: () {
                                    //_dialogBuilder_Application_Template(context);
                                    Navigator.pushNamed(
                                      context,
                                      '/HomePage/Applications',
                                    );
                                  },
                                  child: Text_medium_16_White(
                                    Text_name: 'Создать заявку',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24.0,
                          vertical: 12,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text_medium_18_Black(Text_name: 'ID'),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text_medium_18_Black(
                                Text_name: 'Исполнитель',
                              ),
                            ),
                            SizedBox(width: 4),
                            Expanded(
                              child: Text_medium_18_Black(Text_name: 'Автор'),
                            ),
                            SizedBox(width: 4),
                            Expanded(
                              child: Text_medium_18_Black(Text_name: 'Отдел'),
                            ),
                            SizedBox(width: 4),
                            Expanded(
                              child: Text_medium_18_Black(Text_name: 'Тема'),
                            ),
                            SizedBox(width: 4),
                            Expanded(
                              child: Text_medium_18_Black(
                                Text_name: 'Приоритет',
                              ),
                            ),
                            SizedBox(width: 4),
                            Expanded(
                              child: Text_medium_18_Black(
                                Text_name: 'Статус заявки',
                              ),
                            ),
                            SizedBox(width: 4),
                            Expanded(
                              child: Text_medium_18_Black(
                                Text_name: 'Время создания',
                              ),
                            ),
                            SizedBox(width: 4),
                          ],
                        ),
                      ),
                    ),

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
