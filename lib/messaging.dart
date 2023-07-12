import 'package:flutter/material.dart';

import 'home.dart';

class messaging extends StatefulWidget {
  const messaging({super.key});

  @override
  State<messaging> createState() => _messagingState();
}

class _messagingState extends State<messaging> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
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
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(255, 72, 72, 1),
                                width: 2),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Donor #12345",
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 72, 72, 1),
                                    fontSize: 20),
                              ),
                              Icon(
                                Icons.call,
                                color: Color.fromRGBO(255, 72, 72, 1),
                                size: 28,
                              )
                            ],
                          ),
                        ),
                        Column(
                          children: getRequests(),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          decoration: BoxDecoration(
                              border: Border.all(width: 2),
                              borderRadius: BorderRadius.circular(5)),
                          child: TextField(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }
}

List<Widget> getRequests() {
  List<String> message = [
    "Hello, I would like to know more about the patient.",
    "Yes, I will give you the required information.",
    "Hello, I would like to know more about the patient.",
    "Yes, I will give you the required information.",
    "Hello, I would like to know more about the patient.",
    "Yes, I will give you the required information.",
    "Hello, I would like to know more about the patient.",
    "Yes, I will give you the required information.",
    "Hello, I would like to know more about the patient.",
    "Yes, I will give you the required information.",
    "Hello, I would like to know more about the patient.",
    "Yes, I will give you the required information.",
  ];
  List<String> typeOfUser = [
    "sender",
    "receiver",
    "sender",
    "receiver",
    "sender",
    "receiver",
    "sender",
    "receiver",
    "sender",
    "receiver",
    "sender",
    "receiver",
  ];

  return message
      .asMap()
      .entries
      .map((e) => Align(
            alignment: (typeOfUser[e.key] == "sender")
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 15, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 250,
                    decoration: BoxDecoration(
                        color: (typeOfUser[e.key] == "sender")
                            ? Colors.grey[300]
                            : Colors.grey[400],
                        borderRadius: BorderRadius.circular(5)),
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: Text(
                      message[e.key],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          ))
      .toList();
}
