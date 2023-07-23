// ignore: file_names
// ignore: file_names
import 'package:blood_bank/addRequestError.dart';
import 'package:flutter/material.dart';

import 'database/db_fun.dart';

// ignore: camel_case_types, must_be_immutable
class findDonors extends StatefulWidget {
  List<String> data = [];
  findDonors(this.data, {super.key});

  @override
  // ignore: no_logic_in_create_state
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
bool _validate = false;
final _text = TextEditingController();

// ignore: camel_case_types
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
          title: const Text(
            "Find Donors",
            style: TextStyle(fontFamily: 'poorStory', fontSize: 26),
          ),
          leading: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          toolbarHeight: 80,
          backgroundColor: const Color.fromRGBO(255, 72, 72, 1),
          shadowColor: Colors.transparent,
        ),
        body: DefaultTextStyle(
          style: const TextStyle(
              fontWeight: FontWeight.w500, color: Colors.black, fontSize: 16),
          child: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Column(children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(12),
                      child: const Text(
                        "Patient Blood Type",
                      ),
                    ),
                    const SizedBox(
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
                          style: ElevatedButton.styleFrom(
                              foregroundColor:
                                  _flag1 ? Colors.white : Colors.black,
                              backgroundColor: _flag1
                                  ? const Color.fromRGBO(255, 72, 72, 1)
                                  : Colors.white, // This is what you need!
                              padding: const EdgeInsets.all(10)),
                          child: const Text("A+"),
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
                          style: ElevatedButton.styleFrom(
                              foregroundColor:
                                  _flag2 ? Colors.white : Colors.black,
                              backgroundColor: _flag2
                                  ? const Color.fromRGBO(255, 72, 72, 1)
                                  : Colors.white,
                              // This is what you need!
                              padding: const EdgeInsets.all(10)),
                          child: const Text("A-"),
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
                          style: ElevatedButton.styleFrom(
                              foregroundColor:
                                  _flag3 ? Colors.white : Colors.black,
                              backgroundColor: _flag3
                                  ? const Color.fromRGBO(255, 72, 72, 1)
                                  : Colors.white,
                              // This is what you need!
                              padding: const EdgeInsets.all(10)),
                          child: const Text("B+"),
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
                          style: ElevatedButton.styleFrom(
                              foregroundColor:
                                  _flag4 ? Colors.white : Colors.black,
                              backgroundColor: _flag4
                                  ? const Color.fromRGBO(255, 72, 72, 1)
                                  : Colors.white,
                              // This is what you need!
                              padding: const EdgeInsets.all(10)),
                          child: const Text("B-"),
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
                          style: ElevatedButton.styleFrom(
                              foregroundColor:
                                  _flag5 ? Colors.white : Colors.black,
                              backgroundColor: _flag5
                                  ? const Color.fromRGBO(255, 72, 72, 1)
                                  : Colors.white,
                              // This is what you need!
                              padding: const EdgeInsets.all(10)),
                          child: const Text("AB+"),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
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
                            style: ElevatedButton.styleFrom(
                                foregroundColor:
                                    _flag6 ? Colors.white : Colors.black,
                                backgroundColor: _flag6
                                    ? const Color.fromRGBO(255, 72, 72, 1)
                                    : Colors.white,
                                // This is what you need!
                                padding: const EdgeInsets.all(10)),
                            child: const Text("AB-"),
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
                            style: ElevatedButton.styleFrom(
                                foregroundColor:
                                    _flag7 ? Colors.white : Colors.black,
                                backgroundColor: _flag7
                                    ? const Color.fromRGBO(255, 72, 72, 1)
                                    : Colors.white,
                                // This is what you need!
                                padding: const EdgeInsets.all(10)),
                            child: const Text("O+"),
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
                            style: ElevatedButton.styleFrom(
                                foregroundColor:
                                    _flag8 ? Colors.white : Colors.black,
                                backgroundColor: _flag8
                                    ? const Color.fromRGBO(255, 72, 72, 1)
                                    : Colors.white,
                                // This is what you need!
                                padding: const EdgeInsets.all(10)),
                            child: const Text("O-"),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(12),
                      child: const Text(
                        "Patient Gender",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
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
                            style: ElevatedButton.styleFrom(
                                foregroundColor:
                                    _male ? Colors.white : Colors.black,
                                backgroundColor: _male
                                    ? const Color.fromRGBO(255, 72, 72, 1)
                                    : Colors.white,
                                // This is what you need!
                                padding:
                                    const EdgeInsets.fromLTRB(30, 10, 30, 10)),
                            child: const Text("Male"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _male = false;
                                _female = !_female;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                foregroundColor:
                                    _female ? Colors.white : Colors.black,
                                backgroundColor: _female
                                    ? const Color.fromRGBO(255, 72, 72, 1)
                                    : Colors.white,
                                // This is what you need!
                                padding:
                                    const EdgeInsets.fromLTRB(30, 10, 30, 10)),
                            child: const Text("Female"),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(12),
                      child: const Text(
                        "Patient Relation",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
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
                          style: ElevatedButton.styleFrom(
                              foregroundColor:
                                  _family ? Colors.white : Colors.black,
                              backgroundColor: _family
                                  ? const Color.fromRGBO(255, 72, 72, 1)
                                  : Colors.white,
                              // This is what you need!
                              padding:
                                  const EdgeInsets.fromLTRB(30, 10, 30, 10)),
                          child: const Text("Family"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _family = false;
                              _friend = !_friend;
                              _other = false;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              foregroundColor:
                                  _friend ? Colors.white : Colors.black,
                              backgroundColor: _friend
                                  ? const Color.fromRGBO(255, 72, 72, 1)
                                  : Colors.white,
                              // This is what you need!
                              padding:
                                  const EdgeInsets.fromLTRB(30, 10, 30, 10)),
                          child: const Text("Friend"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _family = false;
                              _friend = false;
                              _other = !_other;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              foregroundColor:
                                  _other ? Colors.white : Colors.black,
                              backgroundColor: _other
                                  ? const Color.fromRGBO(255, 72, 72, 1)
                                  : Colors.white,
                              // This is what you need!
                              padding:
                                  const EdgeInsets.fromLTRB(30, 10, 30, 10)),
                          child: const Text("Other"),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(12),
                      child: const Text(
                        "Patient Age",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: TextField(
                        controller: _text,
                        cursorColor: const Color.fromRGBO(255, 69, 69, 1),
                        onChanged: (value) {
                          age = value;
                        },
                        style: const TextStyle(
                            color: Color.fromRGBO(255, 69, 69, 1)),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "Age",
                            errorText: _validate ? "Age Can't Be Empty" : null,
                            hintStyle: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                            // fillColor: Color.fromRGBO(255, 69, 69, 1),
                            filled: true,
                            focusColor: const Color.fromRGBO(255, 69, 69, 1),
                            // hintText: "",
                            // hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Color.fromRGBO(255, 69, 69, 1)))),
                      ),
                    ),
                  ]),
                  const SizedBox(
                    height: 60,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          _text.text.isEmpty
                              ? _validate = true
                              : _validate = false;
                        });
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

                        if (await DatabaseHelper().addrequest(
                            data[0],
                            patientBlood,
                            patientGender,
                            patientRelation,
                            age,
                            data[5])) {
                          // ignore: use_build_context_synchronously
                          Navigator.pop(context);
                          _validate = false;
                        } else {
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => addRequestError(data)));
                        }
                      },
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(255, 72, 72, 1)),
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.fromLTRB(110, 20, 110, 20))),
                      child: const Text(
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
