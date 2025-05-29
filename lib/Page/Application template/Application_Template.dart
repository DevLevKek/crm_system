import 'package:crm_system/Page/Elements/Elements.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class ApplicationTemplate extends StatefulWidget {
  const ApplicationTemplate({super.key});

  @override
  State<ApplicationTemplate> createState() => _ApplicationTemplateState();
}

class _ApplicationTemplateState extends State<ApplicationTemplate> {
  Query dbRef = FirebaseDatabase.instance.ref().child(
    'Application_template_departament',
  );

  Widget listItem(Map date, String name_dt) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(
          context,
          '/HomePage/ApplicationTemplate/UpdateDepartment/Theme',
          arguments: name_dt,
        );
      },
      child: Container(
        width: double.maxFinite,
        height: 90,
        color: const Color.fromARGB(255, 255, 255, 255),
        margin: EdgeInsets.symmetric(horizontal: 12),
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                var ref = FirebaseDatabase.instance.ref(
                  'Application_template_departament',
                );
                ref.child(name_dt).remove();
              },
              icon: Icon(
                Icons.restore_from_trash,
                color: Color.fromARGB(204, 255, 91, 91),
                size: 25,
              ),
            ),
            IconButton(
              onPressed: () {
                Map<String, String> FireDB = {
                  'name': name_dt,
                  'description': date['description_DP'],
                };
                Navigator.pushReplacementNamed(
                  context,
                  '/HomePage/ApplicationTemplate/UpdateDepartment',
                  arguments: FireDB,
                );
              },
              icon: Icon(
                Icons.settings,
                color: Color.fromARGB(204, 47, 43, 61),
                size: 25,
              ),
            ),

            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name_dt,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: 'Public Sans',
                      color: Color.fromARGB(255, 47, 43, 61),
                    ),
                  ),
                  Text(
                    date['description_DP'],
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      fontFamily: 'Public Sans',
                      color: Color.fromARGB(255, 47, 43, 61),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
                              child: Text_medium_24_Black(Text_name: 'Отделы'),
                            ),
                            SizedBox(height: 12),
                            //-----------------------------------------
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
                                  String name_dt = snapshot.key as String;

                                  return listItem(dt, name_dt);
                                },
                              ),
                            ),
                            //-----------------------------------------
                            ElevatedButton.icon(
                              style: ButtonStyle(
                                minimumSize: WidgetStatePropertyAll(
                                  const Size(700, 50),
                                ),
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                elevation: WidgetStatePropertyAll(0),
                              ),
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  '/HomePage/ApplicationTemplate/CreateDepartment',
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
