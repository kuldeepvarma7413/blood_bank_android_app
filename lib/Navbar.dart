import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

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
                onTap: () {},
              ),
              Divider(),
              ListTile(
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Color.fromRGBO(255, 72, 72, 1),
                ),
                title: Text("Requests", style: TextStyle(fontSize: 18)),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Color.fromRGBO(255, 72, 72, 1),
                ),
                title: Text("History", style: TextStyle(fontSize: 18)),
                onTap: () {},
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
            margin: EdgeInsets.all(20),
            child: TextButton(
                onPressed: () {},
                child: Container(
                  margin: EdgeInsets.all(0),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: Color.fromRGBO(255, 72, 72, 1)),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Signout",
                        style: TextStyle(
                            color: Color.fromRGBO(255, 72, 72, 1),
                            fontSize: 18),
                      ),
                      Image.asset('images/logout.png')
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
