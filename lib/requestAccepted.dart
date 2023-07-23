// ignore: file_names
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RequestAccepted extends StatelessWidget {
  String text = "";
  RequestAccepted(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Request Detail",
            style: TextStyle(fontFamily: 'poorStory', fontSize: 26),
          ),
          leading: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          toolbarHeight: 80,
          backgroundColor: const Color.fromRGBO(255, 72, 72, 1),
          shadowColor: Colors.transparent,
        ),
        body: SafeArea(
            child: Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(18),
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              Text(text),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(255, 72, 72, 1),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 50)),
                child: const Text("Back"),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
