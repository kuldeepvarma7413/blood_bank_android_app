import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(otpverification(
    number: '',
  ));
}

class otpverification extends StatefulWidget {
  final String number;
  otpverification({super.key, required this.number});

  @override
  State<otpverification> createState() => _otpverificationState(number: number);
}

class _otpverificationState extends State<otpverification> {
  _otpverificationState({required this.number});
  final String number;
  FocusNode focus2 = new FocusNode();
  FocusNode focus3 = new FocusNode();
  FocusNode focus4 = new FocusNode();
  FocusNode focus5 = new FocusNode();

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
            physics: BouncingScrollPhysics(),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 220, 0, 0),
                  child: Text(
                    "OTP Verification",
                    style: TextStyle(fontFamily: 'poorStory', fontSize: 20),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    "Enter the OTP sent to +91 $number",
                    style: TextStyle(fontFamily: 'poorStory', fontSize: 16),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
                  width: 250,
                  child: Form(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          height: 48,
                          width: 44,
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length == 1) {
                                // Focus.req
                                FocusScope.of(context).requestFocus(focus2);
                              }
                            },
                            // onSaved: (pin1) {},
                            keyboardType: TextInputType.number,
                            cursorColor: Color.fromRGBO(255, 72, 72, 1),

                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1)
                            ],
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 72, 72, 1)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 72, 72, 1)),
                              ),
                            ),
                          )),
                      SizedBox(
                          height: 48,
                          width: 44,
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).requestFocus(focus3);
                              }
                            },
                            focusNode: focus2,
                            onSaved: (pin2) {},
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 72, 72, 1)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 72, 72, 1)),
                              ),
                            ),
                          )),
                      SizedBox(
                          height: 48,
                          width: 44,
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).requestFocus(focus4);
                              }
                            },
                            focusNode: focus3,
                            onSaved: (pin3) {},
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 72, 72, 1)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 72, 72, 1)),
                              ),
                            ),
                          )),
                      SizedBox(
                          height: 48,
                          width: 44,
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).requestFocus(focus5);
                              }
                            },
                            focusNode: focus4,
                            onSaved: (pin4) {},
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 72, 72, 1)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 72, 72, 1)),
                              ),
                            ),
                          ))
                    ],
                  )),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't receive an OTP?",
                        style: TextStyle(fontSize: 16),
                      ),
                      TextButton(
                        child: Text("Resend OTP",
                            style: TextStyle(
                                color: Color.fromRGBO(250, 72, 72, 1),
                                fontSize: 16)),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: ElevatedButton(
                    focusNode: focus5,
                    child: Text(
                      "VERIFY",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    style: ElevatedButton.styleFrom(
                        elevation: 4,
                        padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                        backgroundColor: Color.fromRGBO(250, 72, 72, 1)),
                    onPressed: () {},
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
