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
            color: Colors.white,
            alignment: Alignment.center,
            child: Container(
              child: Image.asset('images/bloodbank.png'),
            ),
          ),
        )),
      ),
    );
  }
}
