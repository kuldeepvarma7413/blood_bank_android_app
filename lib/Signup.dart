// ignore: file_names
import 'package:blood_bank/database/db_fun.dart';
import 'package:blood_bank/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'NumberAuthentication.dart';

// ignore: camel_case_types
class signup extends StatefulWidget {
  String number;
  signup(this.number, {super.key});

  @override
  State<signup> createState() => _signupState(number);
}

// ignore: camel_case_types
class _signupState extends State<signup> {
  TextEditingController dateinput = TextEditingController();
  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  _signupState(this.number);

  // Initial Selected Value
  String dropdownvalue = 'A+';
  String age = "";
  String number;
  String name = "";
  String healthCondition = "";
  String dob = "";

  // List of items in our dropdown menu
  var items = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(
            child: DefaultTextStyle(
              style:
                  const TextStyle(color: Colors.white, fontFamily: 'poorStory'),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(250, 72, 72, 1),
                        Color.fromRGBO(255, 69, 69, 1)
                      ],
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  padding: const EdgeInsets.fromLTRB(25, 60, 25, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),

                      // full name
                      const Text(
                        "Full Name",
                        style: TextStyle(fontSize: 20),
                      ),
                      TextField(
                        cursorColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                            fillColor: Color.fromRGBO(255, 69, 69, 1),
                            filled: true,
                            focusColor: Colors.blueAccent,
                            // hintText: "",
                            // hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                        onChanged: (value) {
                          name = value;
                        },
                      ),

                      // Date of Birth
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        "Date of Birth",
                        style: TextStyle(fontSize: 20),
                      ),
                      TextField(
                          controller: dateinput,
                          cursorColor: Colors.white,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                              fillColor: Color.fromRGBO(255, 69, 69, 1),
                              filled: true,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                          readOnly:
                              true, //set it true, so that user will not able to edit text
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(
                                    1920), //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime.now());

                            if (pickedDate != null) {
                              String formattedDate = pickedDate.toString();
                              setState(() {
                                dateinput.text =
                                    formattedDate; //set output date to TextField value.
                              });
                            }
                          }),

                      // Age
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        "Age",
                        style: TextStyle(fontSize: 20),
                      ),
                      TextField(
                        cursorColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            fillColor: Color.fromRGBO(255, 69, 69, 1),
                            filled: true,
                            focusColor: Colors.blueAccent,
                            // hintText: "",
                            // hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                        onChanged: (value) {
                          age = value;
                        },
                      ),

                      // Health conditions
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        "Prevailing Health Conditions",
                        style: TextStyle(fontSize: 20),
                      ),
                      TextField(
                        cursorColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                            fillColor: Color.fromRGBO(255, 69, 69, 1),
                            filled: true,
                            focusColor: Colors.blueAccent,
                            // hintText: "",
                            // hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                        onChanged: (value) {
                          healthCondition = value;
                        },
                      ),

                      // Blood Group
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        "Blood Group",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: DropdownButton(
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                          underline: Container(
                            height: 1,
                            color: Colors.white,
                          ),
                          dropdownColor: const Color.fromRGBO(255, 69, 69, 1),
                          // Initial Value
                          value: dropdownvalue,

                          // Down Arrow Icon
                          icon: const Icon(null),

                          // Array list of items
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                      ),

                      // button
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          // ignore: prefer_const_constructors
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              foregroundColor:
                                  const Color.fromRGBO(255, 69, 69, 1),
                              backgroundColor: Colors.white,
                              padding:
                                  const EdgeInsets.fromLTRB(50, 15, 50, 15)),
                          child: const Text(
                            "REGISTER FOR CHECKUP",
                            style: TextStyle(
                                fontFamily: 'poorStory', fontSize: 20),
                          ),
                          onPressed: () async {
                            if (DatabaseHelper().addUser(
                                age,
                                dropdownvalue,
                                dateinput.text,
                                healthCondition,
                                name,
                                number)) {
                              SharedPreferences pref =
                                  await SharedPreferences.getInstance();
                              pref.setString('number', number);
                              pref.setBool('loggedIn', true);
                              List<String> data =
                                  await DatabaseHelper().getdata(number);
                              // ignore: use_build_context_synchronously
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => home(data, number)),
                                  (route) => false);
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
