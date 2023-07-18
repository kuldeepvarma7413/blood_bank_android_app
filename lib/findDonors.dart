import 'package:flutter/material.dart';

import 'database/db_fun.dart';

class findDonors extends StatefulWidget {
  List<String> data = [];
  findDonors(this.data);

  @override
  State<findDonors> createState() => _findDonorsState(data);
}

bool _flag1 = true;
bool _flag2 = false;
bool _flag3 = false;
bool _flag4 = false;
bool _flag5 = false;
bool _flag6 = false;
bool _flag7 = false;
bool _flag8 = false;
bool _male = true;
bool _female = false;
bool _family = true;
bool _friend = false;
bool _other = false;
String age = "";

class _findDonorsState extends State<findDonors> {
  List<String> data = [];
  _findDonorsState(this.data);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Find Donors",
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
              fontWeight: FontWeight.w500, color: Colors.black, fontSize: 16),
          child: SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    // width: 340,
                    // alignment: Alignment.center,
                    child: Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "Patient Blood Type",
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _flag1 = !_flag1;
                                _flag2 = false;
                                _flag3 = false;
                                _flag4 = false;
                                _flag5 = false;
                                _flag6 = false;
                                _flag7 = false;
                                _flag8 = false;
                              });
                            },
                            child: Text("A+"),
                            style: ElevatedButton.styleFrom(
                                foregroundColor:
                                    _flag1 ? Colors.white : Colors.black,
                                backgroundColor: _flag1
                                    ? Color.fromRGBO(255, 72, 72, 1)
                                    : Colors.white, // This is what you need!
                                padding: EdgeInsets.all(10)),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _flag1 = false;
                                _flag2 = !_flag2;
                                _flag3 = false;
                                _flag4 = false;
                                _flag5 = false;
                                _flag6 = false;
                                _flag7 = false;
                                _flag8 = false;
                              });
                            },
                            child: Text("A-"),
                            style: ElevatedButton.styleFrom(
                                foregroundColor:
                                    _flag2 ? Colors.white : Colors.black,
                                backgroundColor: _flag2
                                    ? Color.fromRGBO(255, 72, 72, 1)
                                    : Colors.white,
                                // This is what you need!
                                padding: EdgeInsets.all(10)),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _flag1 = false;
                                _flag2 = false;
                                _flag3 = !_flag3;
                                _flag4 = false;
                                _flag5 = false;
                                _flag6 = false;
                                _flag7 = false;
                                _flag8 = false;
                              });
                            },
                            child: Text("B+"),
                            style: ElevatedButton.styleFrom(
                                foregroundColor:
                                    _flag3 ? Colors.white : Colors.black,
                                backgroundColor: _flag3
                                    ? Color.fromRGBO(255, 72, 72, 1)
                                    : Colors.white,
                                // This is what you need!
                                padding: EdgeInsets.all(10)),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _flag1 = false;
                                _flag2 = false;
                                _flag3 = false;
                                _flag4 = !_flag4;
                                _flag5 = false;
                                _flag6 = false;
                                _flag7 = false;
                                _flag8 = false;
                              });
                            },
                            child: Text("B-"),
                            style: ElevatedButton.styleFrom(
                                foregroundColor:
                                    _flag4 ? Colors.white : Colors.black,
                                backgroundColor: _flag4
                                    ? Color.fromRGBO(255, 72, 72, 1)
                                    : Colors.white,
                                // This is what you need!
                                padding: EdgeInsets.all(10)),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _flag1 = false;
                                _flag2 = false;
                                _flag3 = false;
                                _flag4 = false;
                                _flag5 = !_flag5;
                                _flag6 = false;
                                _flag7 = false;
                                _flag8 = false;
                              });
                            },
                            child: Text("AB+"),
                            style: ElevatedButton.styleFrom(
                                foregroundColor:
                                    _flag5 ? Colors.white : Colors.black,
                                backgroundColor: _flag5
                                    ? Color.fromRGBO(255, 72, 72, 1)
                                    : Colors.white,
                                // This is what you need!
                                padding: EdgeInsets.all(10)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 250,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _flag1 = false;
                                  _flag2 = false;
                                  _flag3 = false;
                                  _flag4 = false;
                                  _flag5 = false;
                                  _flag6 = !_flag6;
                                  _flag7 = false;
                                  _flag8 = false;
                                });
                              },
                              child: Text("AB-"),
                              style: ElevatedButton.styleFrom(
                                  foregroundColor:
                                      _flag6 ? Colors.white : Colors.black,
                                  backgroundColor: _flag6
                                      ? Color.fromRGBO(255, 72, 72, 1)
                                      : Colors.white,
                                  // This is what you need!
                                  padding: EdgeInsets.all(10)),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _flag1 = false;
                                  _flag2 = false;
                                  _flag3 = false;
                                  _flag4 = false;
                                  _flag5 = false;
                                  _flag6 = false;
                                  _flag7 = !_flag7;
                                  _flag8 = false;
                                });
                              },
                              child: Text("O+"),
                              style: ElevatedButton.styleFrom(
                                  foregroundColor:
                                      _flag7 ? Colors.white : Colors.black,
                                  backgroundColor: _flag7
                                      ? Color.fromRGBO(255, 72, 72, 1)
                                      : Colors.white,
                                  // This is what you need!
                                  padding: EdgeInsets.all(10)),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _flag1 = false;
                                  _flag2 = false;
                                  _flag3 = false;
                                  _flag4 = false;
                                  _flag5 = false;
                                  _flag6 = false;
                                  _flag7 = false;
                                  _flag8 = !_flag8;
                                });
                              },
                              child: Text("O-"),
                              style: ElevatedButton.styleFrom(
                                  foregroundColor:
                                      _flag8 ? Colors.white : Colors.black,
                                  backgroundColor: _flag8
                                      ? Color.fromRGBO(255, 72, 72, 1)
                                      : Colors.white,
                                  // This is what you need!
                                  padding: EdgeInsets.all(10)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "Patient Gender",
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 250,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _male = !_male;
                                  _female = false;
                                });
                              },
                              child: Text("Male"),
                              style: ElevatedButton.styleFrom(
                                  foregroundColor:
                                      _male ? Colors.white : Colors.black,
                                  backgroundColor: _male
                                      ? Color.fromRGBO(255, 72, 72, 1)
                                      : Colors.white,
                                  // This is what you need!
                                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10)),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _male = false;
                                  _female = !_female;
                                });
                              },
                              child: Text("Female"),
                              style: ElevatedButton.styleFrom(
                                  foregroundColor:
                                      _female ? Colors.white : Colors.black,
                                  backgroundColor: _female
                                      ? Color.fromRGBO(255, 72, 72, 1)
                                      : Colors.white,
                                  // This is what you need!
                                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "Patient Relation",
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _family = !_family;
                                  _friend = false;
                                  _other = false;
                                });
                              },
                              child: Text("Family"),
                              style: ElevatedButton.styleFrom(
                                  foregroundColor:
                                      _family ? Colors.white : Colors.black,
                                  backgroundColor: _family
                                      ? Color.fromRGBO(255, 72, 72, 1)
                                      : Colors.white,
                                  // This is what you need!
                                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10)),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _family = false;
                                  _friend = !_friend;
                                  _other = false;
                                });
                              },
                              child: Text("Friend"),
                              style: ElevatedButton.styleFrom(
                                  foregroundColor:
                                      _friend ? Colors.white : Colors.black,
                                  backgroundColor: _friend
                                      ? Color.fromRGBO(255, 72, 72, 1)
                                      : Colors.white,
                                  // This is what you need!
                                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10)),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _family = false;
                                  _friend = false;
                                  _other = !_other;
                                });
                              },
                              child: Text("Other"),
                              style: ElevatedButton.styleFrom(
                                  foregroundColor:
                                      _other ? Colors.white : Colors.black,
                                  backgroundColor: _other
                                      ? Color.fromRGBO(255, 72, 72, 1)
                                      : Colors.white,
                                  // This is what you need!
                                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "Patient Age",
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 150,
                        height: 50,
                        child: TextField(
                          cursorColor: Color.fromRGBO(255, 69, 69, 1),
                          onChanged: (value) {
                            age = value;
                          },
                          style:
                              TextStyle(color: Color.fromRGBO(255, 69, 69, 1)),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "Age",
                              hintStyle: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                              // fillColor: Color.fromRGBO(255, 69, 69, 1),
                              filled: true,
                              focusColor: Color.fromRGBO(255, 69, 69, 1),
                              // hintText: "",
                              // hintStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: Color.fromRGBO(255, 69, 69, 1)))),
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        String patientBlood = "";
                        String patientGender = "";
                        String patientRelation = "";

                        // patient Blood
                        if (_flag1 == true) {
                          patientBlood = "A+";
                        } else if (_flag2 == true) {
                          patientBlood = "A-";
                        } else if (_flag3 == true) {
                          patientBlood = "B+";
                        } else if (_flag4 == true) {
                          patientBlood = "B-";
                        } else if (_flag5 == true) {
                          patientBlood = "AB+";
                        } else if (_flag6 == true) {
                          patientBlood = "AB-";
                        } else if (_flag7 == true) {
                          patientBlood = "O+";
                        } else if (_flag8 == true) {
                          patientBlood = "O-";
                        }

                        // patient Gender
                        if (_male == true) {
                          patientGender = "male";
                        } else if (_female == true) {
                          patientGender = "female";
                        } else {
                          patientGender = "not mentioned.";
                        }

                        // patient Relation
                        if (_family == true) {
                          patientRelation = "family";
                        } else if (_friend == true) {
                          patientRelation = "friend";
                        } else if (_other == true) {
                          patientRelation = "other";
                        } else {
                          patientRelation = "not mentioned";
                        }

                        await DatabaseHelper().addrequest(data[0], patientBlood,
                            patientGender, patientRelation, age, "requested");
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(255, 72, 72, 1)),
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.fromLTRB(110, 20, 110, 20))),
                      child: Text(
                        "Send Requests",
                        style: TextStyle(
                          fontFamily: 'poorStory',
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
