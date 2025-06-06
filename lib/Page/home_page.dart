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
    print(updateDB.UpdateUserData());
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

  Query dbRefUser = FirebaseDatabase.instance
      .ref()
      .child('applications')
      .orderByChild('author')
      .equalTo(UserDataMain['email'].toString());
  Query dbRefExecutor = FirebaseDatabase.instance
      .ref()
      .child('applications')
      .orderByChild('departament')
      .equalTo(UserDataMain['departament'].toString());
  Query dbRef = FirebaseDatabase.instance.ref().child('applications');
  @override
  bool _isButtonEnabled = false;

  void dispose() {
    _nameDPController.dispose();
    _descriptionDPController.dispose();
    super.dispose();
  }

  Widget listItem(Map dt, String nameuser, int index, Map apDT) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 2),
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacementNamed(
            context,
            '/HomePage/Application',
            arguments: apDT,
          );
          print(index);
        },
        child: Container(
          height: 70,
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text(dt['executor'].toString())),
                  SizedBox(width: 4),
                  Expanded(child: Text(dt['author'].toString())),
                  SizedBox(width: 4),
                  Expanded(child: Text(dt['departament'].toString())),
                  SizedBox(width: 4),
                  Expanded(child: Container( child: Text(dt['theme'].toString()))),
                  SizedBox(width: 20),
                  Visibility(
                    visible:
                        UserDataMain['privilege'] == 'executor' ||
                        UserDataMain['privilege'] == 'admin',
                    child: Expanded(
                      child:
                          dt['priority'] == 'Критический'
                              ? Text_PRIORITET_critical()
                              : dt['priority'] == 'Средний'
                              ? Text_PRIORITET_medium()
                              : Text_PRIORITET_easy(),
                    ),
                  ),
                  SizedBox(width: 4),

                  dt['status'] == 'Ожидает ответа'
                      ? Text_STATUS_Waiting()
                      : dt['status'] == 'Выполняется'
                      ? Text_STATUS_In_progress()
                      : dt['status'] == 'Решено'
                      ? Text_STATUS_Solved()
                      : Text_STATUS_No_Solved(),

                  SizedBox(width: 4),
                  Expanded(child: Text(dt['time_create'].toString())),
                ],
              ),
              Divider(color: Color.fromARGB(76, 47, 43, 61), thickness: 0.7),
            ],
          ),
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
                                Visibility(
                                  visible: UserDataMain['privilege'] == 'admin',
                                  child: ElevatedButton.icon(
                                    icon: Icon(
                                      Icons.person_outline,
                                      size: 25,
                                      color: Color.fromARGB(255, 47, 43, 61),
                                    ),
                                    style: ButtonStyle(
                                      minimumSize: WidgetStatePropertyAll(
                                        const Size(100, 40),
                                      ),

                                      shadowColor:
                                          WidgetStatePropertyAll<Color>(
                                            Color.fromARGB(0, 255, 225, 227),
                                          ),
                                      shape: WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
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
                            SizedBox(width: 20),
                            Visibility(
                              visible:
                                  UserDataMain['privilege'] == 'executor' ||
                                  UserDataMain['privilege'] == 'admin',
                              child: Expanded(
                                child: Text_medium_18_Black(
                                  Text_name: 'Приоритет',
                                ),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Divider(
                        color: Color.fromARGB(76, 47, 43, 61),
                        thickness: 1,
                      ),
                    ),

                    Expanded(
                      child: FirebaseAnimatedList(
                        query:
                            UserDataMain['privilege'] == 'admin'
                                ? dbRef
                                : UserDataMain['privilege'] == 'executor'
                                ? dbRefExecutor
                                : dbRefUser,
                        itemBuilder: (
                          BuildContext context,
                          DataSnapshot snapshot,
                          Animation<double> animation,
                          int index,
                        ) {
                          Map dt = snapshot.value as Map;
                          String nameuser = snapshot.key as String;
                          Map apDT = {'Hashcode': nameuser};
                          apDT.addAll(dt);
                          print(apDT);
                          return listItem(dt, nameuser, index, apDT);
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
