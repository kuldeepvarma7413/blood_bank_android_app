import 'package:flutter/material.dart';
import 'package:blood_bank/otpverification.dart';

void main() {
  runApp(MaterialApp(
    home: App(),
  ));
}

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return PageView(
      /// [PageView.scrollDirection] defaults to [Axis.horizontal].
      /// Use [Axis.vertical] to scroll vertically.
      controller: controller,
      scrollDirection: Axis.horizontal,
      children: [
        Screen1(),
        Screen2(),
        Screen3(),
        Screen4(),
        numberScreen(),
      ],
    );
    // return MaterialApp(
    //   routes: {
    //     "screen1": (context) => Screen1(),
    //     "screen2": (context) => Screen2(),
    //     "screen3": (context) => Screen3(),
    //     "screen4": (context) => Screen4(),
    //     "numberScreen": (context) => numberScreen(),
    //   },
    //   initialRoute: "screen1",
    // )
  }
}

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

// Screen 2

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
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
                  height: 450,
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    'images/health-check.png',
                    fit: BoxFit.fitWidth,
                    height: 278,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                  width: 270,
                  child: Text(
                    "To be a responsible donor, you must get a check-up.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'PoorStory'),
                    textAlign: TextAlign.center,
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

// Screen3

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
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
                  height: 450,
                  margin: EdgeInsets.all(0),
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    'images/puzzle.png',
                    fit: BoxFit.fitWidth,
                    height: 278,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                  child: Text(
                    "Your blood type should be compatible with the receiver’s type.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'PoorStory'),
                    textAlign: TextAlign.center,
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

// Screen4

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
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
                  height: 450,
                  margin: EdgeInsets.all(0),
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    'images/blood-bag.png',
                    fit: BoxFit.fitWidth,
                    height: 278,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                  child: Text(
                    "Donate your blood and save a life.",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'PoorStory'),
                    textAlign: TextAlign.center,
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

// OTP (numberscreen) screen

class numberScreen extends StatelessWidget {
  numberScreen({super.key});
  String number = "";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                    onChanged: (value) {
                      number = "+91 " + value;
                    },
                    keyboardType: TextInputType.number,
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
                  padding: EdgeInsets.fromLTRB(30, 12, 30, 12),
                  child: TextButton(
                    child: Text(
                      "GET OTP",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  otpverification(number: number)));
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
