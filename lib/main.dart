import 'package:blood_bank/Signup.dart';
import 'package:blood_bank/findDonors.dart';
import 'package:blood_bank/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Screen1.dart';
import 'Screen2.dart';
import 'Screen3.dart';
import 'Screen4.dart';
import 'NumberAuthentication.dart';
import 'database/db_fun.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // List<String> data = await DatabaseHelper().getdata("7413912366");
  // FirebaseFirestore db = FirebaseFirestore.instance;
  // DatabaseHelper().getDetails(db);
  // print(await DatabaseHelper().addrequest(
  //     "kuldeep prajapat", "B-", "male", "friend", "22", "requested"));
  // print(await DatabaseHelper().getExistance("7413917327"));
  // print("done");
  // print(DatabaseHelper().addUser(
  //     21, "O+", "15/5/2003", "no issues", "sandeep singh", 8575515152));
  // print("hii");
  // print();
  // print("hii");
  // List<String> a = await DatabaseHelper().getdata("8003488396");
  // print(data);
  // print(await DatabaseHelper().getrequestedusers());
  print(DatabaseHelper().getrequestedusers());

  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp();

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return PageView(
      /// [PageView.scrollDirection] defaults to [Axis.horizontal].
      /// Use [Axis.vertical] to scroll vertically.
      controller: controller,
      scrollDirection: Axis.horizontal,
      children: [
        // signup(),
        // home(data),
        // Screen1(),
        // Screen2(),
        // Screen3(),
        // Screen4(),
        NumberAuthentication()
        // findDonors()
      ],
    );
  }
}
