import 'package:crm_system/Page/Firebase/databaseUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
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

  @override
  bool _isButtonEnabled = false;

  void dispose() {
    _nameDPController.dispose();
    _descriptionDPController.dispose();
    super.dispose();
  }

  @override
  Future<void> _dialogBuilder_Application_Template(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          title: Center(
            child: Text_medium_24_Black(Text_name: 'Шаблон заявок'),
          ),
          actions: <Widget>[
            Column(
              children: [
                Divider(color: Color.fromARGB(55, 0, 0, 0)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Container(
                      child: Column(
                        children: [
                          Card(
                            elevation: 0,
                            color: Color.fromARGB(255, 255, 255, 255),
                            clipBehavior: Clip.hardEdge,
                            child: SizedBox(
                              height: 60,
                              width: 180,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Color.fromARGB(
                                          255,
                                          114,
                                          103,
                                          240,
                                        ),
                                      ),

                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.people,
                                            size: 40,
                                            color: Color.fromARGB(
                                              255,
                                              255,
                                              255,
                                              255,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Center(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,

                                        children: [
                                          Text_medium_18_Black(
                                            Text_name: 'Отдел',
                                          ),
                                          Text_reqular_13_Black(
                                            Text_name: 'Выберите отдел',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            elevation: 0,
                            color: Color.fromARGB(255, 255, 255, 255),
                            clipBehavior: Clip.hardEdge,
                            child: SizedBox(
                              height: 60,
                              width: 180,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Color.fromARGB(
                                          255,
                                          238,
                                          237,
                                          240,
                                        ),
                                      ),

                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.library_books,
                                            size: 40,
                                            color: Color.fromARGB(
                                              255,
                                              19,
                                              19,
                                              19,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Center(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text_medium_18_Black(
                                            Text_name: 'Тема',
                                          ),
                                          Text_reqular_13_Black(
                                            Text_name: 'Выберите тему',
                                          ),
                                        ],
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
                    SizedBox(width: 12),
                    Container(
                      height: 240,
                      child: VerticalDivider(
                        color: Color.fromARGB(55, 0, 0, 0),
                      ),
                    ),
                    Container(
                      height: 230,
                      width: 530,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text_medium_24_Black(Text_name: 'Отделы'),
                          SizedBox(height: 12),
                          ElevatedButton.icon(
                            style: ButtonStyle(
                              minimumSize: WidgetStatePropertyAll(
                                const Size(700, 50),
                              ),
                              elevation: WidgetStatePropertyAll(0),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              _dialogBuilder_Application_Template_Create_department(
                                context,
                              );
                            },
                            icon: Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 25,
                            ),
                            label: Text_medium_16_Black(
                              Text_name: 'Создать новый отдел',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Future<void> _dialogBuilder_Application_Template_Create_department(
    BuildContext context,
  ) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: <Widget>[
            Column(
              children: [
                Divider(color: Color.fromARGB(55, 0, 0, 0)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Card(
                            elevation: 0,
                            color: Color.fromARGB(255, 255, 255, 255),
                            clipBehavior: Clip.hardEdge,
                            child: SizedBox(
                              height: 60,
                              width: 180,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Color.fromARGB(
                                          255,
                                          114,
                                          103,
                                          240,
                                        ),
                                      ),

                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.people,
                                            size: 40,
                                            color: Color.fromARGB(
                                              255,
                                              255,
                                              255,
                                              255,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Center(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,

                                        children: [
                                          Text_medium_18_Black(
                                            Text_name: 'Отдел',
                                          ),
                                          Text_reqular_13_Black(
                                            Text_name: 'Выберите отдел',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            elevation: 0,
                            color: Color.fromARGB(255, 255, 255, 255),
                            clipBehavior: Clip.hardEdge,
                            child: SizedBox(
                              height: 60,
                              width: 180,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Color.fromARGB(
                                          255,
                                          238,
                                          237,
                                          240,
                                        ),
                                      ),

                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.library_books,
                                            size: 40,
                                            color: Color.fromARGB(
                                              255,
                                              19,
                                              19,
                                              19,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Center(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text_medium_18_Black(
                                            Text_name: 'Тема',
                                          ),
                                          Text_reqular_13_Black(
                                            Text_name: 'Выберите тему',
                                          ),
                                        ],
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
                    SizedBox(width: 12),
                    Container(
                      height: 240,
                      child: VerticalDivider(
                        color: Color.fromARGB(55, 0, 0, 0),
                      ),
                    ),
                    Container(
                      //height: 230,
                      width: 530,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text_medium_22_Black(Text_name: 'Отдел'),
                          SizedBox(height: 8),
                          TextField(
                            controller: _nameDPController,
                            decoration: InputDecoration(
                              label: Text_reqular_15_black(
                                Text_name: 'Название отдела',
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 12),
                          TextField(
                            controller: _descriptionDPController,
                            decoration: InputDecoration(
                              label: Text_reqular_15_black(
                                Text_name: 'Описание',
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 12),
                          //
                          //---------------------------------------------ElevatedButton-----------------------------------------------------
                          //
                          ElevatedButton.icon(
                            label: Text_reqular_15_white(Text_name: 'Далее'),
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.resolveWith<Color>(
                                    (states) =>
                                        _isButtonEnabled
                                            ? Color.fromARGB(255, 40, 199, 111)
                                            : Color.fromARGB(94, 74, 110, 90),
                                  ),
                              shadowColor: WidgetStatePropertyAll<Color>(
                                Color.fromARGB(33, 40, 199, 111),
                              ),
                              elevation: WidgetStatePropertyAll(0),
                            ),
                            onPressed: () async {
                              //???
                              String name = _nameDPController.text.trim();
                              String description =
                                  _descriptionDPController.text.trim();
                              final ref = FirebaseDatabase.instance.ref(
                                'Application_template_departament',
                              );
                              //ref.child(name).set(data);
                              bool name_coincidence = false;

                              DatabaseEvent event = await ref.once();
                              Map<dynamic, dynamic> data_db =
                                  event.snapshot.value as Map<dynamic, dynamic>;
                              data_db.forEach((key, value) {
                                if (key != name) {
                                  Map<String, String> descriptiondata = {
                                    'description_DP': description,
                                  };
                                  ref.child(name).set(descriptiondata);
                                  Navigator.of(context).pop();
                                  _dialogBuilder_Application_Template_Create_Theme(
                                    context,
                                  );
                                  nameDP = name;
                                }
                              });
                              //????
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          title: Center(
            child: Text_medium_24_Black(Text_name: 'Шаблон заявок'),
          ),
        );
      },
    );
  }

  @override
  Future<void> _dialogBuilder_Application_Template_Create_Theme(
    BuildContext context,
  ) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        String selectPriority = _selectPriority;
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              actions: <Widget>[
                Column(
                  children: [
                    Divider(color: Color.fromARGB(55, 0, 0, 0)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Card(
                                elevation: 0,
                                color: Color.fromARGB(255, 255, 255, 255),
                                clipBehavior: Clip.hardEdge,
                                child: SizedBox(
                                  height: 60,
                                  width: 180,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            color: Color.fromARGB(
                                              255,
                                              205,
                                              247,
                                              224,
                                            ),
                                          ),

                                          child: Center(
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                8.0,
                                              ),
                                              child: Icon(
                                                Icons.people,
                                                size: 40,
                                                color: Color.fromARGB(
                                                  255,
                                                  40,
                                                  199,
                                                  111,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 12),
                                        Center(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,

                                            children: [
                                              Text_medium_18_Black(
                                                Text_name: 'Отдел',
                                              ),
                                              Text_reqular_13_Black(
                                                Text_name: 'Выберите отдел',
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                elevation: 0,
                                color: Color.fromARGB(255, 255, 255, 255),
                                clipBehavior: Clip.hardEdge,
                                child: SizedBox(
                                  height: 60,
                                  width: 180,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),

                                            color: Color.fromARGB(
                                              255,
                                              114,
                                              103,
                                              240,
                                            ),
                                          ),

                                          child: Center(
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                8.0,
                                              ),
                                              child: Icon(
                                                Icons.library_books,
                                                size: 40,
                                                color: Color.fromARGB(
                                                  255,
                                                  255,
                                                  255,
                                                  255,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 12),
                                        Center(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text_medium_18_Black(
                                                Text_name: 'Тема',
                                              ),
                                              Text_reqular_13_Black(
                                                Text_name: 'Выберите тему',
                                              ),
                                            ],
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
                        SizedBox(width: 12),
                        Container(
                          height: 240,
                          child: VerticalDivider(
                            color: Color.fromARGB(55, 0, 0, 0),
                          ),
                        ),
                        Container(
                          //height: 230,
                          width: 530,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text_medium_22_Black(Text_name: 'Тема'),
                              SizedBox(height: 8),
                              TextField(
                                controller: _themeDPController,
                                decoration: InputDecoration(
                                  label: Text_reqular_15_black(
                                    Text_name: 'Название темы',
                                  ),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(height: 12),
                              Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      'Низкий',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        fontFamily: 'Public Sans',
                                        color: Color.fromARGB(
                                          255,
                                          40,
                                          199,
                                          111,
                                        ),
                                      ),
                                    ),
                                    focusColor: Color.fromARGB(
                                      255,
                                      40,
                                      199,
                                      111,
                                    ),
                                    leading: Radio<String>(
                                      value: 'Низкий',
                                      groupValue: _selectPriority,
                                      onChanged: (value) {
                                        setState(() {
                                          selectPriority = value!;
                                          _selectPriority = value;
                                        });
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      'Средний',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        fontFamily: 'Public Sans',
                                        color: Color.fromARGB(
                                          255,
                                          255,
                                          158,
                                          67,
                                        ),
                                      ),
                                    ),
                                    focusColor: Color.fromARGB(
                                      255,
                                      255,
                                      158,
                                      67,
                                    ),
                                    leading: Radio<String>(
                                      value: 'Средний',
                                      groupValue: _selectPriority,
                                      onChanged: (value) {
                                        setState(() {
                                          selectPriority = value!;
                                          _selectPriority = value;
                                        });
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      'Критический',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        fontFamily: 'Public Sans',
                                        color: Color.fromARGB(255, 255, 76, 82),
                                      ),
                                    ),
                                    hoverColor: Color.fromARGB(
                                      255,
                                      255,
                                      76,
                                      82,
                                    ),
                                    leading: Radio<String>(
                                      value: 'Критический',
                                      groupValue: _selectPriority,
                                      onChanged: (value) {
                                        setState(() {
                                          selectPriority = value!;
                                          _selectPriority = value;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 12),
                              //
                              //---------------------------------------------ElevatedButton-----------------------------------------------------
                              //
                              ElevatedButton.icon(
                                label: Text_reqular_15_white(
                                  Text_name: 'Далее',
                                ),
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.resolveWith<Color>(
                                        (states) =>
                                            _isButtonEnabled
                                                ? Color.fromARGB(
                                                  255,
                                                  40,
                                                  199,
                                                  111,
                                                )
                                                : Color.fromARGB(
                                                  94,
                                                  74,
                                                  110,
                                                  90,
                                                ),
                                      ),
                                  // WidgetStatePropertyAll<Color>(
                                  //   Color.fromARGB(255, 40, 199, 111),
                                  // ),
                                  shadowColor: WidgetStatePropertyAll<Color>(
                                    Color.fromARGB(33, 40, 199, 111),
                                  ),
                                  elevation: WidgetStatePropertyAll(0),
                                ),
                                onPressed: () async {
                                  var ref = FirebaseDatabase.instance.ref();
                                  DatabaseEvent event = await ref.once();
                                  Map<dynamic, dynamic> data =
                                      event.snapshot.value
                                          as Map<dynamic, dynamic>;
                                  data.forEach((key, value) {
                                    print(key);
                                    if (key == nameDP) {
                                      Map<String, String> theme = {
                                        'name_theme':
                                            _themeDPController.text.trim(),
                                        'priority': _selectPriority,
                                      };
                                      ref.set('Application_template_theme');
                                      //ref.child(nameDP).set(theme);
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              title: Center(
                child: Text_medium_24_Black(Text_name: 'Шаблон заявок'),
              ),
            );
          },
        );
      },
    );
  }
  //final user = FirebaseAuth.instance.currentUser!;
  // DatabaseReference ref = FirebaseDatabase.instance.ref("users");
  // String role = ''; // Переменная для хранения роли
  // var adm = true;

  // @override
  // void initState() {
  //   super.initState();
  //   // Настройка прослушивания изменений в базе данных
  //   ref.onValue.listen((DatabaseEvent event) {
  //     print(event.snapshot.value);
  //     if (event.snapshot.value != null) {
  //       Map<dynamic, dynamic> data =
  //           event.snapshot.value as Map<dynamic, dynamic>;
  //       data.forEach((key, value) {
  //         if (key == user.email) {
  //           setState(() {
  //             role = value['role'] ?? ''; // Присваивание значения роли
  //           });
  //         }
  //       });
  //     }
  //   });
  // }

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
                          Text_medium_18_Black(Text_name: 'ФИЛЬТР'),
                          Visibility(
                            visible: UserDataMain['privilege'] == 'user',
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
                                backgroundColor: WidgetStatePropertyAll<Color>(
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
                                Text_name: 'Редактор',
                              ),
                            ),
                          ),
                        ],
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
