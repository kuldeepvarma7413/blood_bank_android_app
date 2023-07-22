import 'package:flutter/material.dart';

class RequestAccepted extends StatelessWidget {
  String text = "";
  RequestAccepted(this.text);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Request Detail",
            style: TextStyle(fontFamily: 'poorStory', fontSize: 26),
          ),
          leading: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          toolbarHeight: 80,
          backgroundColor: Color.fromRGBO(255, 72, 72, 1),
          shadowColor: Colors.transparent,
        ),
        body: SafeArea(
            child: Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(18),
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              Text(text),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text("Back"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(255, 72, 72, 1),
                    padding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 50)),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
