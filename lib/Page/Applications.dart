import 'package:crm_system/Page/Elements/Elements.dart';
import 'package:crm_system/Page/Firebase/databaseUser.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Applications extends StatefulWidget {
  const Applications({super.key});

  @override
  State<Applications> createState() => _ApplicationsState();
}

class _ApplicationsState extends State<Applications> {
  @override
  void initState() {
    super.initState();
    dUsers();
    UpdateDB updateDB = UpdateDB();
    updateDB.UpdateUserData();
    print(updateDB);
  }

  @override
  void dispose() {
    comment.dispose();
    super.dispose();
  }

  dUsers() async {
    var refAT = FirebaseDatabase.instance.ref(
      'Application_template_departament',
    );
    DatabaseEvent event = await refAT.once();
    Map<dynamic, dynamic> data_db = event.snapshot.value as Map;
    List<String> dt = ['   '];
    data_db.forEach((key, value) {
      dt.add(key.toString());
    });
    setState(() {
      dApplication_template_departament = dt;
      selectDeportament = dApplication_template_departament.first;
    });
  }

  final comment = TextEditingController();
  List<String> dApplication_template_departament = [];
  List<String> dApplication_template_theme = [];
  bool choose_deportament = false;
  String selectDeportament = '';
  String selectTheme = '';
  String oldDepartament = '   ';
  String priority = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 248, 247, 250),
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            height: 500,
            width: 660,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Center(child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon_Close_Button(context),
                    Text_medium_24_Black(Text_name: 'Заявка'),
                    SizedBox(width: 1,)
                  ],
                )),
                SizedBox(height: 24),

                Row(
                  children: [
                    Text_medium_18_Black(Text_name: 'Отдел: '),
                    SizedBox(width: 12),
                    DropdownButton<String>(
                      value: selectDeportament,
                      items:
                          dApplication_template_departament
                              .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              })
                              .toList(),
                      onChanged: (value) async {
                        setState(() {
                          selectDeportament = value.toString();
                        });

                        dApplication_template_theme.clear();
                        selectTheme = '';
                        priority = ''; 
                        choose_deportament = true;
                        if (selectDeportament != '   ') {
                          var refAT = FirebaseDatabase.instance
                              .ref('Application_template_departament')
                              .child(selectDeportament);
                          DatabaseEvent event = await refAT.once();
                          setState(() {
                            Map<dynamic, dynamic> data_db =
                                event.snapshot.value as Map;
                            data_db.forEach((key, value) {
                              if (key == 'theme') {
                                Map<dynamic, dynamic> data = value as Map;
                                data.forEach((key, value) {
                                  dApplication_template_theme.add(
                                    key.toString(),
                                  );
                                });
                              }
                            });
                          });
                          // print(dApplication_template_theme);
                          // print(choose_deportament);
                        } else {}
                      },
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Text_medium_18_Black(Text_name: 'Тема: '),
                    SizedBox(width: 12),
                    DropdownButton<String>(
                      value: selectTheme.isNotEmpty ? selectTheme : null,
                      items:
                          dApplication_template_theme.isNotEmpty
                              ? dApplication_template_theme
                                  .map<DropdownMenuItem<String>>((
                                    String value,
                                  ) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  })
                                  .toList()
                              : null,
                      onChanged: (newvalue) async {
                        setState(() {
                          selectTheme = newvalue.toString();
                        });
                        var refAT = FirebaseDatabase.instance
                            .ref('Application_template_departament')
                            .child(selectDeportament);
                        DatabaseEvent event = await refAT.once();

                        Map<dynamic, dynamic> data_db =
                            event.snapshot.value as Map;
                        data_db.forEach((key, value) {
                          if (key == 'theme') {
                            Map<dynamic, dynamic> data = value as Map;
                            data.forEach((key, value) {
                              if (selectTheme == key) {
                                Map<dynamic, dynamic > dd = value as Map; 
                                dd.forEach((key, value) {
                                  priority = value;
                                  print(priority);
                                },);
                              }
                            });
                          }
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text_medium_18_Black(Text_name: 'Комментарий'),
                    TextField(
                      maxLines: 5,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      controller: comment,
                    ),
                  ],
                ),
                SizedBox(height: 24),
                selectDeportament.isNotEmpty & selectTheme.isNotEmpty
                    ? ElevatedButton(
                      style: ButtonStyle(
                        elevation: WidgetStatePropertyAll(0),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        backgroundColor: WidgetStatePropertyAll<Color>(
                          Color.fromARGB(255, 115, 103, 240),
                        ),
                      ),
                      child: Text_medium_16_White(Text_name: 'Создать заявку'),
                      onPressed: () async {
                        DateTime now = new DateTime.now();
                        DateTime date = new DateTime(
                          now.year,
                          now.month,
                          now.day,
                          now.hour,
                          now.minute,
                          now.second,
                        );
                        Map<String, String> Application = {
                          'departament': selectDeportament,
                          'theme': selectTheme,
                          'comment': comment.text.trim(),
                          'author': UserDataMain['email'].toString(),
                          'executor': '',
                          'time_create': date.toString(),
                          'status': 'Ожидает ответа',
                          'priority': priority,
                        };

                        var ref =
                            FirebaseDatabase.instance
                                .ref('applications')
                                .push();
                        ref.set(Application);

                        Navigator.pushReplacementNamed(context, '/HomePage');
                      },
                    )
                    : ElevatedButton(
                      style: ButtonStyle(
                        elevation: WidgetStatePropertyAll(0),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        backgroundColor: WidgetStatePropertyAll<Color>(
                          Color.fromARGB(78, 114, 103, 240),
                        ),
                      ),
                      child: Text_medium_16_White(Text_name: 'Создать заявку'),
                      onPressed: null,
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
