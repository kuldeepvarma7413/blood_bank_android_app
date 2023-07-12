import 'package:blood_bank/home.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController dateinput = TextEditingController();
  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  // Initial Selected Value
  String dropdownvalue = 'A +';

  // List of items in our dropdown menu
  var items = [
    'A +',
    'A -',
    'B +',
    'B -',
    'AB +',
    'AB -',
    'O +',
    'O -',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(
            child: DefaultTextStyle(
              style: TextStyle(color: Colors.white, fontFamily: 'poorStory'),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color.fromRGBO(250, 72, 72, 1),
                        Color.fromRGBO(255, 69, 69, 1)
                      ],
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.fromLTRB(25, 60, 25, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),

                      // full name
                      Text(
                        "Full Name",
                        style: TextStyle(fontSize: 20),
                      ),
                      TextField(
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            fillColor: Color.fromRGBO(255, 69, 69, 1),
                            filled: true,
                            focusColor: Colors.blueAccent,
                            // hintText: "",
                            // hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      ),

                      // Date of Birth
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Date of Birth",
                        style: TextStyle(fontSize: 20),
                      ),
                      TextField(
                          controller: dateinput,
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
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
                              print(pickedDate);
                              String formattedDate =
                                  DateFormat('dd-MM-yyyy').format(pickedDate);
                              setState(() {
                                dateinput.text =
                                    formattedDate; //set output date to TextField value.
                              });
                            }
                          }),

                      // Age
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Age",
                        style: TextStyle(fontSize: 20),
                      ),
                      TextField(
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            fillColor: Color.fromRGBO(255, 69, 69, 1),
                            filled: true,
                            focusColor: Colors.blueAccent,
                            // hintText: "",
                            // hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      ),

                      // Health conditions
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Prevailing Health Conditions",
                        style: TextStyle(fontSize: 20),
                      ),
                      TextField(
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            fillColor: Color.fromRGBO(255, 69, 69, 1),
                            filled: true,
                            focusColor: Colors.blueAccent,
                            // hintText: "",
                            // hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      ),

                      // Blood Group
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Blood Group",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: DropdownButton(
                          style: TextStyle(color: Colors.white, fontSize: 16),
                          underline: Container(
                            height: 1,
                            color: Colors.white,
                          ),
                          dropdownColor: Color.fromRGBO(255, 69, 69, 1),
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
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          // ignore: prefer_const_constructors
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              foregroundColor: Color.fromRGBO(255, 69, 69, 1),
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.fromLTRB(50, 15, 50, 15)),
                          child: Text(
                            "REGISTER FOR CHECKUP",
                            style: TextStyle(
                                fontFamily: 'poorStory', fontSize: 20),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => home()));
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
