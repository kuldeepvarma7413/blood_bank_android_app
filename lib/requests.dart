import 'package:flutter/material.dart';

import 'database/db_fun.dart';

class requests extends StatefulWidget {
  List<String> data;
  requests(this.data);

  @override
  State<requests> createState() => _requestsState(data);
}

class _requestsState extends State<requests> {
  List<String> data = [];
  _requestsState(this.data);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "Requests",
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
                      child: Text("gii"),
                      // child: StreamBuilder(builder: builder),
                      // child: Column(
                      //   children: getRequests(),
                      // ),
                    )),
              ),
            )));
  }
}

List<Widget> getRequests() {
  // request lists in navbar and then pass here
  // List<String> users = getuser();
  List<String> users = [
    "12345",
    "12344",
    "123655",
    "12346",
    "12348",
  ];

  return users
      .asMap()
      .entries
      .map((e) => Container(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Container(
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
                        padding: EdgeInsets.fromLTRB(7, 0, 0, 0),
                        child: Text(
                          users[e.key],
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: null,
                        child: Text(
                          "View Details",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.red,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(255, 72, 72, 1)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(width: 1, color: Colors.black),
                            ),
                          ),
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.fromLTRB(30, 5, 30, 5)),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Accept",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(width: 1, color: Colors.black),
                            ),
                          ),
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.fromLTRB(30, 5, 30, 5)),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Decline",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ))
      .toList();
}
