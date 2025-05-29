import 'package:crm_system/Page/Elements/Elements.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ApplicationTemplateCreateTheme extends StatefulWidget {
  const ApplicationTemplateCreateTheme({super.key});
  @override
  State<ApplicationTemplateCreateTheme> createState() =>
      _ApplicationTemplateCreateThemeState();
}

class _ApplicationTemplateCreateThemeState
    extends State<ApplicationTemplateCreateTheme> {
      
  String _selectPriority = 'Низкий';
  final _themeDPController = TextEditingController();
  void changeRadioValue(String? value) {
    _selectPriority = value!;
    setState(() {});
  }

  String namedb = '';
  void initState() {
    super.initState();
    _themeDPController.addListener(_updateButtonState);
    // проверяет изменение. Если есть изменения, то выполняет функци. _updateButtonState
  }

  @override
  void didChangeDependencies() {
    RouteSettings settings = ModalRoute.of(context)!.settings;
    print(settings.arguments);
    if (settings.arguments != null) {
      String obj = settings.arguments as String;
      namedb = obj;
    }
    super.didChangeDependencies();
  }

  void _updateButtonState() {
    setState(() {
      if (_themeDPController.text.isNotEmpty) {
        _isButtonEnabled = true;
      } else {
        _isButtonEnabled = false;
      }
    });
  }

  @override
  bool _isButtonEnabled = false;

  void dispose() {
    _themeDPController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 248, 247, 250),
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            height: 340,
            width: 760,
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
              children: [
                Row(
                  children: [
                    Icon_Close_Button(context),
                    Expanded(
                      child: Center(
                        child: Text_medium_24_Black(Text_name: 'Шаблон заявок'),
                      ),
                    ),
                  ],
                ),
                Divider(color: Color.fromARGB(55, 0, 0, 0)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
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
                                          205,
                                          247,
                                          224,
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
                                            Text_name: 'Отдел создан',
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
                                          114,
                                          103,
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
                      Container(
                        height: 235,
                        child: VerticalDivider(
                          color: Color.fromARGB(55, 0, 0, 0),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                            SizedBox(height: 24),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text_medium_16_Black(Text_name: 'Приоритет'),
                                SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            height: 24,
                                            width: 24,
                                            child: Radio(
                                              value: 'Низкий',
                                              groupValue: _selectPriority,
                                              activeColor: const Color.fromARGB(
                                                255,
                                                40,
                                                199,
                                                111,
                                              ),
                                              onChanged: (String? value) {
                                                changeRadioValue(value);
                                              },
                                            ),
                                          ),
                                          Text(
                                            'Низкий',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                              fontFamily: 'Public Sans',
                                              color:
                                                  _selectPriority == 'Низкий'
                                                      ? Color.fromARGB(
                                                        255,
                                                        40,
                                                        199,
                                                        111,
                                                      )
                                                      : Color.fromARGB(
                                                        181,
                                                        0,
                                                        0,
                                                        0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 24),
                                    Container(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            height: 24,
                                            width: 24,
                                            child: Radio(
                                              value: 'Средний',
                                              groupValue: _selectPriority,
                                              activeColor: const Color.fromARGB(
                                                255,
                                                255,
                                                158,
                                                67,
                                              ),
                                              onChanged: (String? value) {
                                                changeRadioValue(value);
                                              },
                                            ),
                                          ),
                                          Text(
                                            'Средний',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                              fontFamily: 'Public Sans',
                                              color:
                                                  _selectPriority == 'Средний'
                                                      ? Color.fromARGB(
                                                        255,
                                                        255,
                                                        158,
                                                        67,
                                                      )
                                                      : Color.fromARGB(
                                                        181,
                                                        0,
                                                        0,
                                                        0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 24),
                                    Container(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            height: 24,
                                            width: 24,
                                            child: Radio(
                                              value: 'Критический',
                                              groupValue: _selectPriority,
                                              activeColor: const Color.fromARGB(
                                                255,
                                                255,
                                                76,
                                                82,
                                              ),
                                              onChanged: (String? value) {
                                                changeRadioValue(value);
                                              },
                                            ),
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            'Критический',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                              fontFamily: 'Public Sans',
                                              color:
                                                  _selectPriority ==
                                                          'Критический'
                                                      ? Color.fromARGB(
                                                        255,
                                                        255,
                                                        76,
                                                        82,
                                                      )
                                                      : Color.fromARGB(
                                                        181,
                                                        0,
                                                        0,
                                                        0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
                                              ? Color.fromARGB(
                                                255,
                                                40,
                                                199,
                                                111,
                                              )
                                              : Color.fromARGB(94, 74, 110, 90),
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
                                String name_theme =
                                    _themeDPController.text.trim();
                                var ref = FirebaseDatabase.instance.ref(
                                  'Application_template_departament',
                                );
                                DatabaseEvent event = await ref.once();
                                Map<dynamic, dynamic> data =
                                    event.snapshot.value
                                        as Map<dynamic, dynamic>;
                                data.forEach((key, value) {
                                  if (key == namedb) {
                                    print(value);
                                  }
                                });
                                Map<String, String> themeDBB = {
                                  'Priority': _selectPriority,
                                };
                                ref
                                    .child(namedb)
                                    .child('theme')
                                    .child(name_theme)
                                    .set(themeDBB);
                                Navigator.pushReplacementNamed(
                                  context,
                                  '/HomePage/ApplicationTemplate',
                                );
                              },
                            ),
                          ],
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
    );
  }
}
