import 'package:blood_bank/NumberAuthentication.dart';
import 'package:blood_bank/database/db_fun.dart';
import 'package:blood_bank/deleteRequest.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class addRequestError extends StatelessWidget {
  const addRequestError({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Request Error",
            style: TextStyle(fontFamily: 'poorStory', fontSize: 26),
          ),
          leading: TextButton(
              onPressed: () {
                Navigator.pop(context);
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
          color: Color.fromRGBO(255, 70, 70, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "You have already requested a request. Try another account or delete existing request.",
                style: TextStyle(color: Colors.white, fontSize: 22),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () async {
                  var data = await DatabaseHelper()
                      .getrequestdata(NumberAuthentication.number);
                  if (!(data.isEmpty)) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => deleteRequest(data)));
                  }
                },
                child: Text(
                  "Check Requests",
                  style: TextStyle(color: Color.fromRGBO(255, 72, 72, 1)),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 15)),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text(
                  "Back",
                  style: TextStyle(color: Color.fromRGBO(255, 72, 72, 1)),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
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
