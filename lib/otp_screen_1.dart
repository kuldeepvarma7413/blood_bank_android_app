import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                  child: TextField(
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
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(250, 72, 72, 1)),
                  margin: EdgeInsets.fromLTRB(0, 70, 0, 0),
                  padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                  child: Text(
                    "GET OTP",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
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
