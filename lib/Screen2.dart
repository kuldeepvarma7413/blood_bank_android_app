// ignore: file_names
import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: (SafeArea(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromRGBO(250, 72, 72, 1),
              Color.fromRGBO(255, 69, 69, 1)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            alignment: Alignment.center,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 450,
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    'images/health-check.png',
                    fit: BoxFit.fitWidth,
                    height: 278,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                  width: 270,
                  child: const Text(
                    "To be a responsible donor, you must get a check-up.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'PoorStory'),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 185,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    Text(
                      " Swipe left to continue",
                      style: TextStyle(color: Colors.white),
                      // textAlign: TextAlign.center,
                    ),
                  ],
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
