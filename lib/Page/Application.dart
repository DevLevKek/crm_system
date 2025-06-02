import 'package:crm_system/Page/Elements/Elements.dart';
import 'package:crm_system/Page/Firebase/databaseUser.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  void initState() {
    super.initState();
    UpdateDB updateDB = UpdateDB();
    updateDB.UpdateUserData();
  }

  Map bd = {};
  void didChangeDependencies() {
    super.didChangeDependencies();
    RouteSettings settings = ModalRoute.of(context)!.settings;
    print(settings.arguments);
    if (settings.arguments != null) {
      Map obj = settings.arguments as Map;
      bd = obj;
      print(bd);
    }
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget successfulButton = TextButton(
      child: Text(
        "Успешно",
        style: TextStyle(color: Color.fromARGB(255, 40, 199, 111)),
      ),
      onPressed: () {
        var ref = FirebaseDatabase.instance
            .ref('applications')
            .child(bd['Hashcode']);
        ref.update({'status': 'Решено'});
        bd['status'] = 'Решено';
        print(bd['status']);
        Navigator.pushReplacementNamed(context, '/HomePage');
      },
    );
    Widget notsuccessfulButton = TextButton(
      child: Text(
        "Не успешно",
        style: TextStyle(color: Color.fromARGB(255, 255, 76, 82)),
      ),
      onPressed: () {
        var ref = FirebaseDatabase.instance
            .ref('applications')
            .child(bd['Hashcode']);
        ref.update({'status': 'Не успешно'});
        bd['status'] = 'Не успешно';
        print(bd['status']);
        Navigator.pushReplacementNamed(context, '/HomePage');
      },
    );
    Widget cancelButton = TextButton(
      child: Text("Отмена"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Завершить заявку ?"),
      content: Text("Успешно ли завершилась заявка?"),
      actions: [cancelButton, notsuccessfulButton, successfulButton],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 248, 247, 250),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 400.0,
              vertical: 25,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(52, 47, 43, 61),
                    blurRadius: 20,
                    //offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon_Close_Button(context),
                  SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text_medium_24_Black(Text_name: 'Заявка'),
                          SizedBox(width: 12),
                          Container(
                            height: 10,
                            width: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  bd['priority'] == 'Критический'
                                      ? const Color.fromARGB(255, 255, 76, 82)
                                      : bd['priority'] == 'Средний'
                                      ? const Color.fromARGB(255, 255, 158, 67)
                                      : const Color.fromARGB(255, 40, 199, 111),
                            ),
                          ),
                        ],
                      ),

                      bd['status'] == 'Ожидает ответа'
                          ? Text_STATUS_Waiting()
                          : bd['status'] == 'Выполняется'
                          ? Text_STATUS_In_progress()
                          : bd['status'] == 'Решено'
                          ? Text_STATUS_Solved()
                          : Text_STATUS_No_Solved(),
                    ],
                  ),
                  SizedBox(height: 12),
                  Divider(
                    color: Color.fromARGB(76, 47, 43, 61),
                    thickness: 0.7,
                  ),
                  Column(
                    children: [
                      SizedBox(height: 12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text_medium_18_Black(
                              Text_name: 'Дата Создания: ',
                            ),
                          ),
                          Text(
                            bd['time_create'].toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              fontFamily: 'Public Sans',
                              color: Color.fromARGB(131, 47, 43, 61),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text_medium_18_Black(Text_name: 'Отдел: '),
                          ),
                          Text(
                            bd['departament'].toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              fontFamily: 'Public Sans',
                              color: Color.fromARGB(131, 47, 43, 61),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text_medium_18_Black(Text_name: 'Тема: '),
                          ),
                          Text(
                            bd['theme'].toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              fontFamily: 'Public Sans',
                              color: Color.fromARGB(131, 47, 43, 61),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text_medium_18_Black(Text_name: 'Автор: '),
                          ),
                          Text(
                            bd['author'].toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              fontFamily: 'Public Sans',
                              color: Color.fromARGB(131, 47, 43, 61),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text_medium_18_Black(
                              Text_name: 'Исполнитель: ',
                            ),
                          ),
                          Text(
                            bd['executor'].toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              fontFamily: 'Public Sans',
                              color: Color.fromARGB(131, 47, 43, 61),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      Divider(
                        color: Color.fromARGB(76, 47, 43, 61),
                        thickness: 0.7,
                      ),
                      SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text_medium_18_Black(Text_name: 'Комментарий'),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 200,
                            child: Text(
                              bd['comment'].toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                fontFamily: 'Public Sans',
                                color: Color.fromARGB(131, 47, 43, 61),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Visibility(
                        visible: UserDataMain['privilege'] == 'executor',
                        child:
                            bd['status'] == 'Ожидает ответа'
                                ? Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      style: ButtonStyle(
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
                                              Color.fromARGB(255, 40, 199, 111),
                                            ),
                                      ),
                                      onPressed: () async {
                                        setState(() {});
                                        var ref = FirebaseDatabase.instance
                                            .ref('applications')
                                            .child(bd['Hashcode']);
                                        ref.update({'status': 'Выполняется'});
                                        ref.update({'executor': UserDataMain['email']});
                                        bd['status'] = 'Выполняется';
                                        bd['executor'] = UserDataMain['email'];
                                        print(bd['status']);
                                      },
                                      child: Text_medium_16_White(
                                        Text_name: 'Принять заявку',
                                      ),
                                    ),
                                  ],
                                )
                                : bd['status'] == 'Выполняется'
                                ? Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      style: ButtonStyle(
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
                                              Color.fromARGB(255, 40, 199, 111),
                                            ),
                                      ),
                                      onPressed: () {
                                        showAlertDialog(context);
                                      },
                                      child: Text_medium_16_White(
                                        Text_name: 'Завершить заявку',
                                      ),
                                    ),
                                  ],
                                )
                                : Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      style: ButtonStyle(
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
                                              Color.fromARGB(0, 40, 199, 111),
                                            ),
                                      ),
                                      onPressed: null,
                                      child: Text_medium_16_White(
                                        Text_name: 'Принять заявку',
                                      ),
                                    ),
                                  ],
                                ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
