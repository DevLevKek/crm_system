import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

Map<String, String> UserDataMain = {'name': '', 'email': '', 'privilege': ''};

class UpdateDB {
  final user = FirebaseAuth.instance.currentUser!;
  Future<void> UpdateUserData() async {
    User user = FirebaseAuth.instance.currentUser!;
    var mail = user.email;
    var ref = FirebaseDatabase.instance.ref('users');
    DatabaseEvent event = await ref.once();
    Map<dynamic, dynamic> data = event.snapshot.value as Map<dynamic, dynamic>;
    data.forEach((key, value) {
      if (key.toString() == mail.toString().replaceAll('.', '_')) {
        Map<dynamic, dynamic> data_db = value as Map<dynamic, dynamic>;
        data_db.forEach((key, value) {
          UserDataMain["email"] = mail.toString();
          if (key == 'name') {
            UserDataMain['name'] = value.toString();
          }
          if (key == 'privilege') {
            UserDataMain['privilege'] = value;
          }
        });
      }
    });
  }
}


