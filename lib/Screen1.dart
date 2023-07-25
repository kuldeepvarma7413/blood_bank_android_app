// ignore: file_names
import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: (SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 350,
                ),
                Image.asset('images/bloodbank.png'),
                SizedBox(
                  height: 250,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: Color.fromRGBO(255, 72, 72, 1),
                    ),
                    Text(
                      " Swipe left to continue",
                      style: TextStyle(color: Color.fromRGBO(255, 72, 72, 1)),
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
