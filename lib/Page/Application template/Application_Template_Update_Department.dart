import 'package:crm_system/Page/Elements/Elements.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class ApplicationTemplateUpdateDepartment extends StatefulWidget {
  const ApplicationTemplateUpdateDepartment({super.key});

  @override
  State<ApplicationTemplateUpdateDepartment> createState() =>
      _ApplicationTemplateUpdateDepartment();
}

class _ApplicationTemplateUpdateDepartment
    extends State<ApplicationTemplateUpdateDepartment> {
  final _nameDPController = TextEditingController();
  final _descriptionDPController = TextEditingController();
  void initState() {
    super.initState();
    _nameDPController.addListener(_updateButtonState);
    _descriptionDPController.addListener(_updateButtonState);
    // проверяет изменение. Если есть изменения, то выполняет функци. _updateButtonState
  }

  void _updateButtonState() {
    setState(() {
      if (_nameDPController.text.isNotEmpty |
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

  String namedb = '';
  String descriptiondp = '';
  void didChangeDependencies() {
    RouteSettings settings = ModalRoute.of(context)!.settings;
    if (settings.arguments != null) {
      Map obj = settings.arguments as Map;
      namedb = obj['name'];
      descriptiondp = obj['description'];
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 248, 247, 250),
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            height: 450,
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
                Container(
                  height: 342,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                    color: Color.fromARGB(255, 114, 103, 240),
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
                                      Text_medium_18_Black(Text_name: 'Отдел'),
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
                      VerticalDivider(color: Color.fromARGB(55, 0, 0, 0)),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //-------------------
                            SizedBox(height: 8),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 12),
                              child: Text_medium_24_Black(
                                Text_name: 'Изменить отдел',
                              ),
                            ),
                            SizedBox(height: 12),
                            TextField(
                              controller: _nameDPController,
                              decoration: InputDecoration(
                                helperText: namedb,
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
                                helperText: descriptiondp,
                                label: Text_reqular_15_black(
                                  Text_name: 'Описание',
                                ),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 12),
                            //
                            //---------------------------------------------ElevatedButton-----------------------------------------------------//
                            //
                            ElevatedButton.icon(
                              label: Text_reqular_15_white(
                                Text_name: 'Обновить данные',
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
                                              : Color.fromARGB(94, 30, 41, 35),
                                    ),
                                shadowColor: WidgetStatePropertyAll<Color>(
                                  Color.fromARGB(33, 40, 199, 111),
                                ),
                                elevation: WidgetStatePropertyAll(0),
                              ),
                              onPressed:
                                  _isButtonEnabled
                                      ? () async {
                                        String name =
                                            _nameDPController.text.trim();
                                        String description =
                                            _descriptionDPController.text
                                                .trim();
                                        //----------------------
                                        var ref = FirebaseDatabase.instance.ref(
                                          'Application_template_departament',
                                        );
                                        String name_dep_old = '';
                                        String descriptiondp = '';
                                        Map olddata = {};
                                        DatabaseEvent event = await ref.once();
                                        Map<dynamic, dynamic> data_db =
                                            event.snapshot.value as Map;
                                        data_db.forEach((key, value) {
                                          if (key == namedb) {
                                            if (name.isNotEmpty) {
                                              name_dep_old = name;
                                            } else {
                                              name_dep_old = namedb;
                                            }
                                            Map<dynamic, dynamic>
                                            data_db_theme = value as Map;
                                            data_db_theme.forEach((key, value) {
                                              if (key == 'theme') {
                                                olddata = value;
                                              }
                                              if (description.isNotEmpty) {
                                                descriptiondp = description;
                                              } else {
                                                if (key == 'description_DP') {
                                                  descriptiondp = value;
                                                }
                                              }
                                            });
                                            Map<dynamic, dynamic> new_data = {
                                              'description_DP': descriptiondp,
                                              'theme': olddata,
                                            };

                                            ref.child(namedb).remove();
                                            ref
                                                .child(name_dep_old)
                                                .set(new_data);
                                          }
                                        });
                                        Navigator.pop(context);
                                      }
                                      : null,
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
