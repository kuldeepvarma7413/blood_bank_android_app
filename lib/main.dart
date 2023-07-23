import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'NumberAuthentication.dart';
import 'package:blood_bank/Screen1.dart';
import 'package:blood_bank/Screen2.dart';
import 'package:blood_bank/Screen3.dart';
import 'package:blood_bank/Screen4.dart';
import 'package:blood_bank/home.dart';
import 'package:blood_bank/database/db_fun.dart';
import 'firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> isUserLoggedIn() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('loggedIn') ?? false;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var pref = await SharedPreferences.getInstance();
  String? number = pref.getString('number');
  List<String> data = await DatabaseHelper().getdata(number);
  runApp(MaterialApp(
      home: await isUserLoggedIn() ? home(data, number) : const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return PageView(
      /// [PageView.scrollDirection] defaults to [Axis.horizontal].
      /// Use [Axis.vertical] to scroll vertically.
      controller: controller,
      scrollDirection: Axis.horizontal,
      children: const [
        Screen1(),
        Screen2(),
        Screen3(),
        Screen4(),
        NumberAuthentication()
      ],
    );
  }
}
