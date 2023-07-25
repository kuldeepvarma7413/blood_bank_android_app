import 'package:blood_bank/messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

String formatTime(String timestamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
  final now = DateTime.now();
  final diff = now.difference(date);
  if (diff.inDays == 0) {
    return DateFormat('yyyy-MM-dd kk:mm').format(date);
  } else {
    return DateFormat('dd/MM HH:mm').format(date);
  }
}

// ignore: camel_case_types, must_be_immutable
class myRequests extends StatefulWidget {
  String? number;
  myRequests(this.number, {super.key});

  @override
  // ignore: no_logic_in_create_state
  State<myRequests> createState() => _myRequestsState(number);
}

// ignore: camel_case_types
class _myRequestsState extends State<myRequests> {
  String? number;
  _myRequestsState(this.number);
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_is_empty
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                "My Requests",
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
                  child: Container(
                    // padding: const EdgeInsets.only(top: 0),
                    child: getmyRequests(number),
                  ),
                ))));
  }
}

Widget getmyRequests(String? number) {
  return StreamBuilder(
      // filter myRequests where status is pending, and it is not in the declined_myRequests array of user
      stream: FirebaseFirestore.instance
          .collection("requests")
          .where("status", isEqualTo: "accepted")
          // .where("number", isNotEqualTo: number)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("Something went wrong"),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.redAccent,
            ),
          );
        }

        if (snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text(
              "No myRequests found!",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          );
        }

        // Filter out the documents where declined_by contains user.uid
        // This is done to prevent user from seeing myRequests that he has declined
        var filteredDocs = snapshot.data!.docs.where((doc) {
          final notUser = doc["number"];
          return notUser.contains(number);
        }).toList();

        if (snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text(
              "No myRequests found!",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          );
        }

        return ListView(
          children: filteredDocs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            return _buildRequestCard(context, data, number);
          }).toList(),
        );
      });
}

Widget _buildRequestCard(
    BuildContext context, Map<String, dynamic> data, String? number2) {
  // return a container with req id at left and 2 vertical buttons to accept or decline
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 1),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.25),
          spreadRadius: 1,
          blurRadius: 5,
          offset: const Offset(0, 1),
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // requester id and view details
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                "Accepted By ${data['donor'].substring(0, 4)}***${data['donor'].substring(7, 10)}",
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            // view details
            Text.rich(
              TextSpan(
                  text: 'View Details',
                  style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xffFA4848),
                      fontWeight: FontWeight.w500),
                  recognizer: TapGestureRecognizer()
                    // show details of request
                    ..onTap = () {
                      viewDetails(data, context);
                    }),
            )
          ],
        ),
        // accept or decline buttons
        Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => messaging(data['donor'], number2),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffFA4848),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text(
                "Message",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

// handle view details
void viewDetails(Map<String, dynamic> data, BuildContext context) {
  // show a popup showing patient age and blood group type along with qty
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Request Details"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Patient Age: ${data['patientAge']} yrs"),
              const SizedBox(height: 10),
              Text("Blood Group: ${data['patientBlood']}"),
              const SizedBox(height: 10),
              Text("Quantity: ${data['qty']} ml"),
              const SizedBox(height: 10),
              Text("Requested on: ${formatTime(data['createdAt'])}"),
              const SizedBox(height: 10),
              Text("Accepted By: ${data['donor']}"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Close"),
            ),
          ],
        );
      });
}
