import 'package:blood_bank/NumberAuthentication.dart';
import 'package:blood_bank/Signup.dart';
import 'package:blood_bank/database/db_fun.dart';
import 'package:blood_bank/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

String code = "";

// ignore: camel_case_types
class otpverification extends StatefulWidget {
  String countryCode;
  String number;
  String verify;
  otpverification(this.countryCode, this.number, this.verify, {super.key});

  @override
  State<otpverification> createState() =>
      _otpverificationState(countryCode, number, verify);
}

// ignore: camel_case_types
class _otpverificationState extends State<otpverification> {
  String countryCode;
  String number;
  String verify;
  _otpverificationState(this.countryCode, this.number, this.verify);
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
            child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 220, 0, 0),
                  child: const Text(
                    "OTP Verification",
                    style: TextStyle(fontFamily: 'poorStory', fontSize: 20),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    "Enter the OTP sent to ${countryCode + number}",
                    style:
                        const TextStyle(fontFamily: 'poorStory', fontSize: 16),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 80, 0, 0),
                  width: 250,
                  child: OTPTextField(
                    length: 6,
                    width: MediaQuery.of(context).size.width,
                    fieldWidth: 40,
                    style: const TextStyle(fontSize: 17),
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldStyle: FieldStyle.underline,
                    onChanged: (pin) {
                      code = pin;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Didn't receive an OTP?",
                        style: TextStyle(fontSize: 16),
                      ),
                      TextButton(
                        child: const Text("Resend OTP",
                            style: TextStyle(
                                color: Color.fromRGBO(250, 72, 72, 1),
                                fontSize: 16)),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 4,
                        padding: const EdgeInsets.fromLTRB(100, 20, 100, 20),
                        backgroundColor: const Color.fromRGBO(250, 72, 72, 1)),
                    onPressed: () async {
                      try {
                        PhoneAuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: verify, smsCode: code);

                        // Sign the user in (or link) with the credential
                        await auth.signInWithCredential(credential);
                        if (await DatabaseHelper().getExistance(number)) {
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
                        } else {
                          // ignore: use_build_context_synchronously
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => signup(number)),
                              (route) => false);
                        }
                        // ignore: empty_catches
                      } catch (e) {}
                    },
                    child: const Text(
                      "VERIFY",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
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
