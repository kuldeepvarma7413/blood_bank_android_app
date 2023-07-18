import 'package:blood_bank/messaging.dart';
import 'package:flutter/material.dart';

class messages extends StatefulWidget {
  const messages({super.key});

  @override
  State<messages> createState() => _messagesState();
}

class _messagesState extends State<messages> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "Messages",
                style: TextStyle(fontFamily: 'poorStory', fontSize: 26),
              ),
              leading: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
              toolbarHeight: 80,
              backgroundColor: Color.fromRGBO(255, 72, 72, 1),
              shadowColor: Colors.transparent,
            ),
            body: DefaultTextStyle(
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 16),
              child: SafeArea(
                child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Container(
                      child: Column(
                        children: getRequests(context),
                      ),
                    )),
              ),
            )));
  }
}

List<Widget> getRequests(BuildContext context) {
  List<String> users = [
    "Donor1234",
    "Donor1234",
    "Donor1234",
    "Donor1234",
    "Donor1234",
    "Donor1234",
    "Donor1234",
    "Donor1234"
  ];
  List<String> message = [
    "Hello, I am available",
    "Hello, I am available",
    "Hello, I am available",
    "Hello, I am available",
    "Hello, I am available",
    "Hello, I am available",
    "Hello, I am available",
    "Hello, I am available"
  ];

  return users
      .asMap()
      .entries
      .map((e) => Container(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
            decoration: BoxDecoration(
              border: BorderDirectional(
                  bottom: BorderSide(width: 1.0, color: Colors.grey)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(7, 0, 0, 10),
                      child: Text(
                        users[e.key],
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(7, 0, 0, 0),
                      child: Text(
                        message[e.key],
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Color.fromRGBO(255, 72, 72, 1),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => messaging()));
                    },
                  ),
                )
              ],
            ),
          ))
      .toList();
}
