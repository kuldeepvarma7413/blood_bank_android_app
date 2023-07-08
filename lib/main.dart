import 'package:flutter/material.dart';
import 'Screen1.dart';
import 'Screen2.dart';
import 'Screen3.dart';
import 'Screen4.dart';
import 'NumberAuthentication.dart';
import 'Signup.dart';
import 'home.dart';
import 'findDonors.dart';

void main() {
  runApp(MaterialApp(
    home: MyWidget(),
  ));
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return PageView(
      /// [PageView.scrollDirection] defaults to [Axis.horizontal].
      /// Use [Axis.vertical] to scroll vertically.
      controller: controller,
      scrollDirection: Axis.horizontal,
      children: [
        findDonors(),
        home(),
        signup(),
        Screen1(),
        Screen2(),
        Screen3(),
        Screen4(),
        NumberAuthentication()
      ],
    );
  }
}
