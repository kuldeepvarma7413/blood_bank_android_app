import 'package:blood_bank/NumberAuthentication.dart';
import 'package:blood_bank/database/db_fun.dart';
import 'package:blood_bank/messages.dart';
import 'package:blood_bank/requests.dart';
import 'package:blood_bank/history.dart';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  List<String> data = [];
  Navbar(this.data);

  @override
  State<Navbar> createState() => _NavbarState(data);
}

class _NavbarState extends State<Navbar> {
  List<String> data = [];
  _NavbarState(this.data);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            color: Color.fromRGBO(255, 118, 118, 1),
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Image.asset(
                  'images/heart.png',
                  fit: BoxFit.fitWidth,
                  height: 120,
                ),
                Text(
                  "Donor #32457",
                  style: TextStyle(fontFamily: 'poorStory', fontSize: 24),
                ),
                Text(
                  "Donor Status : Approved",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              ListTile(
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Color.fromRGBO(255, 72, 72, 1),
                ),
                title: Text(
                  "Messages",
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => messages()));
                },
              ),
              Divider(),
              ListTile(
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Color.fromRGBO(255, 72, 72, 1),
                ),
                title: Text("Requests", style: TextStyle(fontSize: 18)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => requests(data)));
                },
              ),
              Divider(),
              ListTile(
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Color.fromRGBO(255, 72, 72, 1),
                ),
                title: Text("History", style: TextStyle(fontSize: 18)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => history()));
                },
              ),
              Divider(),
              ListTile(
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Color.fromRGBO(255, 72, 72, 1),
                ),
                title: Text("Settings", style: TextStyle(fontSize: 18)),
                onTap: () {},
              ),
              Divider(),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20),
                    backgroundColor: Colors.white,
                    shadowColor: Colors.transparent,
                    side: BorderSide(
                      width: 2,
                      color: Color.fromRGBO(255, 72, 72, 1),
                    )),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NumberAuthentication()),
                      (route) => false);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
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
