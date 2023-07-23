import 'package:shared_preferences/shared_preferences.dart';
import 'package:blood_bank/database/db_fun.dart';
import 'package:blood_bank/requestAccepted.dart';
import 'package:blood_bank/requestdetail.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class requests extends StatefulWidget {
  List<String> data;
  List<String> users;
  requests(this.data, this.users, {super.key});

  @override
  // ignore: no_logic_in_create_state
  State<requests> createState() => _requestsState(data, users);
}

// ignore: camel_case_types
class _requestsState extends State<requests> {
  List<String> data = [];
  List<String> users;
  _requestsState(this.data, this.users);
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_is_empty
    if (users.length == 0) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Requests",
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
        body: const Center(
          child: Text(
            "No requests found!",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      );
    }
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                "Requests",
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
            body: DefaultTextStyle(
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 16),
              child: SafeArea(
                child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: getRequests(context, users),
                    )),
              ),
            )));
  }
}

List<Widget> getRequests(BuildContext context, List<String> requestedusers) {
  // request lists in navbar and then pass here
  // List<String> users = getuser();
  List<String> users = requestedusers;

  return users
      .asMap()
      .entries
      .map((e) => Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Container(
              padding: const EdgeInsets.only(bottom: 10),
              decoration: const BoxDecoration(
                border: BorderDirectional(
                    bottom: BorderSide(width: 1.0, color: Colors.grey)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                        child: Text(
                          "By : ${users[e.key]}",
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          var data = await DatabaseHelper()
                              .getrequestdata(users[e.key]);
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RequestDetail(data)));
                        },
                        child: const Text(
                          "View Details",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.red,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: const MaterialStatePropertyAll(
                              Color.fromRGBO(255, 72, 72, 1)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: const BorderSide(
                                  width: 1, color: Colors.black),
                            ),
                          ),
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.fromLTRB(30, 5, 30, 5)),
                        ),
                        onPressed: () async {
                          SharedPreferences pref =
                              await SharedPreferences.getInstance();

                          var data = await DatabaseHelper()
                              .getrequestdata(users[e.key]);
                          if (await DatabaseHelper().isRequestUpdated(
                              data, users[e.key], pref.getString('number'))) {
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RequestAccepted(
                                        "Thank you for accepting request, You blood can save a life.")));
                          }
                        },
                        child: const Text(
                          "Accept",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      // TextButton(
                      //   style: ButtonStyle(
                      //     shape: MaterialStateProperty.all(
                      //       RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(10.0),
                      //         side: BorderSide(width: 1, color: Colors.black),
                      //       ),
                      //     ),
                      //     padding: MaterialStatePropertyAll(
                      //         EdgeInsets.fromLTRB(30, 5, 30, 5)),
                      //   ),
                      //   onPressed: () {},
                      //   child: Text(
                      //     "Decline",
                      //     style: TextStyle(color: Colors.black),
                      //   ),
                      // ),
                    ],
                  )
                ],
              ),
            ),
          ))
      .toList();
}
