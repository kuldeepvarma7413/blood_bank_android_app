// ignore: file_names
// ignore: file_names
import 'package:blood_bank/NumberAuthentication.dart';
import 'package:blood_bank/SettingScreen.dart';
import 'package:blood_bank/database/db_fun.dart';
import 'package:blood_bank/messages.dart';
import 'package:blood_bank/requests.dart';
import 'package:blood_bank/history.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class Navbar extends StatefulWidget {
  List<String> data = [];
  String? number;
  Navbar(this.data, this.number, {super.key});

  @override
  // ignore: no_logic_in_create_state
  State<Navbar> createState() => _NavbarState(data, number);
}

class _NavbarState extends State<Navbar> {
  List<String> data = [];
  String? number;
  _NavbarState(this.data, this.number);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            color: const Color.fromRGBO(255, 118, 118, 1),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Image.asset(
                  'images/heart.png',
                  fit: BoxFit.fitWidth,
                  height: 120,
                ),
                Text(
                  data[0],
                  style: const TextStyle(fontFamily: 'poorStory', fontSize: 24),
                ),
                Text(
                  data[5],
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              ListTile(
                trailing: const Icon(
                  Icons.arrow_forward,
                  color: Color.fromRGBO(255, 72, 72, 1),
                ),
                title: const Text(
                  "Messages",
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => messages(number)));
                },
              ),
              const Divider(),
              ListTile(
                trailing: const Icon(
                  Icons.arrow_forward,
                  color: Color.fromRGBO(255, 72, 72, 1),
                ),
                title: const Text("Requests", style: TextStyle(fontSize: 18)),
                onTap: () async {
                  // ignore: use_build_context_synchronously
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => requests(number)));
                },
              ),
              const Divider(),
              ListTile(
                trailing: const Icon(
                  Icons.arrow_forward,
                  color: Color.fromRGBO(255, 72, 72, 1),
                ),
                title: const Text("History", style: TextStyle(fontSize: 18)),
                onTap: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => history(number)));
                },
              ),
              const Divider(),
              ListTile(
                trailing: const Icon(
                  Icons.arrow_forward,
                  color: Color.fromRGBO(255, 72, 72, 1),
                ),
                title: const Text("Settings", style: TextStyle(fontSize: 18)),
                onTap: () async {
                  List<String> data1 = await DatabaseHelper().getdata(data[5]);
                  // ignore: use_build_context_synchronously
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SettingsScreen(data1)));
                },
              ),
              const Divider(),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    backgroundColor: Colors.white,
                    shadowColor: Colors.transparent,
                    side: const BorderSide(
                      width: 2,
                      color: Color.fromRGBO(255, 72, 72, 1),
                    )),
                onPressed: () async {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  pref.remove('number');
                  pref.setBool('loggedIn', false);
                  // ignore: use_build_context_synchronously
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NumberAuthentication()),
                      (route) => false);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Signout",
                      style: TextStyle(
                          fontSize: 18, color: Color.fromRGBO(255, 72, 72, 1)),
                    ),
                    Image.asset('images/logout.png')
                  ],
                )),
          )
        ],
      ),
    );
  }
}
