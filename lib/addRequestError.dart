// ignore: file_names
import 'package:blood_bank/database/db_fun.dart';
import 'package:blood_bank/deleteRequest.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class addRequestError extends StatelessWidget {
  List<String> data;
  addRequestError(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Request Error",
            style: TextStyle(fontFamily: 'poorStory', fontSize: 26),
          ),
          leading: TextButton(
              onPressed: () {
                Navigator.pop(context);
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
          color: const Color.fromRGBO(255, 70, 70, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "You have already requested a request. Try another account or delete existing request.",
                style: TextStyle(color: Colors.white, fontSize: 22),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () async {
                  var data1 = await DatabaseHelper().getrequestdata(data[5]);
                  // ignore: prefer_is_not_empty
                  if (!(data1.isEmpty)) {
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => deleteRequest(data1)));
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 15)),
                child: const Text(
                  "Check Requests",
                  style: TextStyle(color: Color.fromRGBO(255, 72, 72, 1)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 50)),
                child: const Text(
                  "Back",
                  style: TextStyle(color: Color.fromRGBO(255, 72, 72, 1)),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
