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
            child: Container(
              child: Image.asset('images/bloodbank.png'),
            ),
          ),
        )),
      ),
    );
  }
}
