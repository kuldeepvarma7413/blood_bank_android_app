import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RequestDetail extends StatelessWidget {
  List<String> data;
  RequestDetail(this.data, {super.key});

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(
                            color: Color.fromRGBO(255, 72, 72, 1),
                            fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Patient Blood",
                        style: TextStyle(
                            color: Color.fromRGBO(255, 72, 72, 1),
                            fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Patient Age",
                        style: TextStyle(
                            color: Color.fromRGBO(255, 72, 72, 1),
                            fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Patient Gender",
                        style: TextStyle(
                            color: Color.fromRGBO(255, 72, 72, 1),
                            fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Patient Relation",
                        style: TextStyle(
                            color: Color.fromRGBO(255, 72, 72, 1),
                            fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Number",
                        style: TextStyle(
                            color: Color.fromRGBO(255, 72, 72, 1),
                            fontSize: 18),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ": ${data[0]}",
                        style: const TextStyle(
                            color: Color.fromRGBO(255, 72, 72, 1),
                            fontSize: 18),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        ": ${data[1]}",
                        style: const TextStyle(
                            color: Color.fromRGBO(255, 72, 72, 1),
                            fontSize: 18),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        ": ${data[2]}",
                        style: const TextStyle(
                            color: Color.fromRGBO(255, 72, 72, 1),
                            fontSize: 18),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        ": ${data[3]}",
                        style: const TextStyle(
                            color: Color.fromRGBO(255, 72, 72, 1),
                            fontSize: 18),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        ": ${data[4]}",
                        style: const TextStyle(
                            color: Color.fromRGBO(255, 72, 72, 1),
                            fontSize: 18),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        ": ${data[5]}",
                        style: const TextStyle(
                            color: Color.fromRGBO(255, 72, 72, 1),
                            fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
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
