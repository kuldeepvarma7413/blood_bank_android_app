// ignore: file_names
import 'package:flutter/material.dart';

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

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
                  margin: const EdgeInsets.all(0),
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    'images/blood-bag.png',
                    fit: BoxFit.fitWidth,
                    height: 278,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                  child: const Text(
                    "Donate your blood and save a life.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'PoorStory'),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 210,
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
