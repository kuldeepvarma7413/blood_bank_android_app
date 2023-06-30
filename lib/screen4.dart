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
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              const Color.fromRGBO(250, 72, 72, 1),
              Color.fromRGBO(255, 69, 69, 1)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            alignment: Alignment.center,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 400,
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    'images/blood-bag.png',
                    width: 300,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 300,
                  margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                  child: Text(
                    "Donate your blood and save a life.",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
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
