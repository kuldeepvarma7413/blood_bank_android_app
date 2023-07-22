import 'package:flutter/material.dart';

class RequestDetail extends StatelessWidget {
  List<String> data;
  RequestDetail(this.data);

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
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
                        style: TextStyle(
                            color: Color.fromRGBO(255, 72, 72, 1),
                            fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        ": ${data[1]}",
                        style: TextStyle(
                            color: Color.fromRGBO(255, 72, 72, 1),
                            fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        ": ${data[2]}",
                        style: TextStyle(
                            color: Color.fromRGBO(255, 72, 72, 1),
                            fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        ": ${data[3]}",
                        style: TextStyle(
                            color: Color.fromRGBO(255, 72, 72, 1),
                            fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        ": ${data[4]}",
                        style: TextStyle(
                            color: Color.fromRGBO(255, 72, 72, 1),
                            fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        ": ${data[5]}",
                        style: TextStyle(
                            color: Color.fromRGBO(255, 72, 72, 1),
                            fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
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
