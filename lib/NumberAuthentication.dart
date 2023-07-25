// ignore: file_names
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'otpverification.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> setUserLoggedIn(bool value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('loggedIn', false);
}

class NumberAuthentication extends StatefulWidget {
  const NumberAuthentication();
  static String countryCode = "";
  static String verify = "";
  static String number = "";
  static String pin = "";
  static bool _isPressed = false;

  @override
  State<NumberAuthentication> createState() => _NumberAuthenticationState();
}

class _NumberAuthenticationState extends State<NumberAuthentication> {
  _NumberAuthenticationState();
  String countryCode = "+91";
  String verify = "";
  String number = "";
  String pin = "";
  bool _isPressed = false;

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
                    margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: const Text(
                      "Enter Your Mobile Number",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'PoorStory', fontSize: 20),
                    )),
                Container(
                  width: 300,
                  margin: const EdgeInsets.fromLTRB(0, 12, 0, 0),
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
                      cursorColor: const Color.fromRGBO(255, 72, 72, 1),
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              borderSide:
                                  const BorderSide(color: Colors.black)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              borderSide: const BorderSide(color: Colors.red)),
                          prefixIcon: Container(
                            width: 100,
                            alignment: Alignment.center,
                            child: const Text(
                              "+91",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 18,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w700),
                              // textAlign: TextAlign.right,
                            ),
                          )),
                      style: const TextStyle(
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
                      color: const Color.fromRGBO(250, 72, 72, 1)),
                  margin: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                  padding: const EdgeInsets.fromLTRB(30, 12, 30, 12),
                  child: TextButton(
                    child: const Text(
                      "GET OTP",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: _isPressed
                        ? null
                        : () async {
                            setState(() {
                              _isPressed = true;
                            });
                            Timer(Duration(seconds: 15), () {
                              setState(() {
                                _isPressed = false;
                              });
                            });
                            await FirebaseAuth.instance.verifyPhoneNumber(
                              phoneNumber: countryCode + number,
                              verificationCompleted:
                                  (PhoneAuthCredential credential) {},
                              verificationFailed: (FirebaseAuthException e) {},
                              codeSent:
                                  (String verificationId, int? resendToken) {
                                verify = verificationId;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => otpverification(
                                            countryCode, number, verify)));
                              },
                              codeAutoRetrievalTimeout:
                                  (String verificationId) {},
                            );
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
