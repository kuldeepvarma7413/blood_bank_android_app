import 'package:flutter/material.dart';
import 'otpverification.dart';

class NumberAuthentication extends StatelessWidget {
  NumberAuthentication({super.key});
  String number = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: (SafeArea(
          child: Container(
            color: Colors.white,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    // height: 450,
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Text(
                      "Enter Your Mobile Number",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'PoorStory', fontSize: 20),
                    )),
                Container(
                  width: 300,
                  margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
                  child: Form(
                    child: TextFormField(
                      onChanged: (value) {
                        number = value;
                      },
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return "Enter correct number";
                      //   } else {
                      //     return null;
                      //   }
                      // },
                      keyboardType: TextInputType.number,
                      cursorColor: Color.fromRGBO(255, 72, 72, 1),
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              borderSide: BorderSide(color: Colors.black)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              borderSide: BorderSide(color: Colors.red)),
                          prefixIcon: Container(
                            width: 100,
                            alignment: Alignment.center,
                            child: Text(
                              "+91",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 18,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w700),
                              // textAlign: TextAlign.right,
                            ),
                          )),
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(250, 72, 72, 1)),
                  margin: EdgeInsets.fromLTRB(0, 70, 0, 0),
                  padding: EdgeInsets.fromLTRB(30, 12, 30, 12),
                  child: TextButton(
                    child: Text(
                      "GET OTP",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  otpverification(number: number)));
                    },
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
