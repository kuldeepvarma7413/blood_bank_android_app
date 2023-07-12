import 'package:flutter/material.dart';

import 'home.dart';

class history extends StatefulWidget {
  const history({super.key});

  @override
  State<history> createState() => _historyState();
}

class _historyState extends State<history> {
  bool _flag1 = true;
  bool _flag2 = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "History",
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
                    child: Column(children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                        decoration: BoxDecoration(
                            border: BorderDirectional(
                                bottom: BorderSide(
                                    width: 2,
                                    color: Color.fromRGBO(255, 72, 72, 1)))),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _flag1 = !_flag1;
                                    _flag2 = false;
                                  });
                                },
                                child: Text("Donated",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400)),
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 1,
                                            color: Color.fromRGBO(
                                                255, 72, 72, 1))),
                                    foregroundColor:
                                        _flag1 ? Colors.white : Colors.black,
                                    backgroundColor: _flag1
                                        ? Color.fromRGBO(255, 72, 72, 1)
                                        : Colors
                                            .white, // This is what you need!
                                    padding:
                                        EdgeInsets.fromLTRB(60, 10, 60, 10)),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _flag1 = false;
                                    _flag2 = !_flag2;
                                  });
                                },
                                child: Text(
                                  "Received",
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 1,
                                            color: Color.fromRGBO(
                                                255, 72, 72, 1))),
                                    foregroundColor:
                                        _flag2 ? Colors.white : Colors.black,
                                    backgroundColor: _flag2
                                        ? Color.fromRGBO(255, 72, 72, 1)
                                        : Colors.white,
                                    // This is what you need!
                                    padding:
                                        EdgeInsets.fromLTRB(60, 10, 60, 10)),
                              ),
                            ]),
                      )
                      // asdfghjkl
                      ,
                      Column(
                        children: getRequests(),
                      ),
                    ]),
                  ),
                ),
              ),
            )));
  }
}

List<Widget> getRequests() {
  List<String> date = [
    "11/12/18",
    "12/12/18",
    "13/12/18",
    "14/12/18",
    "15/12/18",
    "16/12/18",
    "17/12/18",
    "18/12/18"
  ];
  List<String> locations = [
    "ludhiana",
    "ludhiana",
    "ludhiana",
    "ludhiana",
    "ludhiana",
    "ludhiana",
    "ludhiana",
    "ludhiana"
  ];
  List<String> receivers = [
    "1265",
    "1245",
    "1267",
    "1264",
    "1295",
    "1212",
    "1232",
    "1248"
  ];
  List<String> quantity = [
    "0.6",
    "0.6",
    "0.6",
    "0.6",
    "0.6",
    "0.6",
    "0.6",
    "0.6"
  ];

  return date
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
                          "Date : " + date[e.key],
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: null,
                        child: Text(
                          "Location : " + locations[e.key],
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14),
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 7, 0),
                        child: Text(
                          "Receiver ID : #" + receivers[e.key],
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: null,
                        child: Text(
                          "Qty : " + quantity[e.key] + "ounces",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ))
      .toList();
}
