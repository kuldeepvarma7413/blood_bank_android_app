import 'package:blood_bank/messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
class history extends StatefulWidget {
  String? number;
  history(this.number, {super.key});

  @override
  // ignore: no_logic_in_create_state
  State<history> createState() => _historyState(number);
}

// ignore: camel_case_types
class _historyState extends State<history> {
  String tab = "donate";
  String? number;
  _historyState(this.number);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "History",
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
      body: Container(
          color: Colors.grey[200],
          child: Column(
            children: [
              Container(
                height: 40,
                // button to switch between donate and receive
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            tab = 'donate';
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: tab == 'donate'
                                ? const Color(0xffFA4848)
                                : Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              'Donated',
                              style: TextStyle(
                                color: tab == 'donate'
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            tab = 'receive';
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: tab == 'receive'
                                ? const Color(0xffFA4848)
                                : Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              'Received',
                              style: TextStyle(
                                color: tab == 'receive'
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // list
              Expanded(
                child: tab == 'donate'
                    ? _buildDonatedList(number)
                    : _buildReceivedList(number),
              ),
            ],
          )),
    );
  }
}

Widget _buildReceivedList(String? number) {
  // for each collection in requests, fetch the requests and show them in a list where donor id is current user id
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  return StreamBuilder(
      stream: firestore
          .collection("requests")
          .where("requested_by", isEqualTo: number)
          .where("status", isEqualTo: "accepted")
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

        // ignore: prefer_is_empty
        if (snapshot.data!.docs.length == 0) {
          return const Center(
              child: Text(
            "No Received history found!",
            style: TextStyle(fontWeight: FontWeight.w500),
          ));
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            Map<String, dynamic> item =
                snapshot.data!.docs[index].data() as Map<String, dynamic>;
            return getReceiveItem(context, item, number);
          },
        );
      });
}

Widget _buildDonatedList(String? number) {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  return StreamBuilder(
    stream: firestore
        .collection("requests")
        .where("donor", isEqualTo: number)
        .snapshots(),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
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

      if (snapshot.data!.docs.length == 0) {
        return const Center(
            child: Text(
          "No donated history found!",
          style: TextStyle(fontWeight: FontWeight.w500),
        ));
      }

      return ListView.builder(
        itemCount: snapshot.data!.docs.length,
        itemBuilder: (context, index) {
          // get the request details
          Map<String, dynamic> request =
              snapshot.data!.docs[index].data() as Map<String, dynamic>;
          return getDonateItem(context, request, number);
        },
      );
    },
  );
}

Widget getDonateItem(
    BuildContext context, Map<String, dynamic> request, String? number) {
  // return a container having date and location at the left side of card, receiver id and qty at the right side of card
  return InkWell(
    onTap: () => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => messaging(request['number'], number),
      ),
    ),
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Date : ${formatTime(request['createdAt'])}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Location : 123, XYZ Apt',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'To ${request['number'].substring(0, 10)}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Qty: ${request['qty']}ml',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget getReceiveItem(
    BuildContext context, Map<String, dynamic> data, String? number) {
  // return a container having date and location at the left side of card, receiver id and qty and view details at the right side of card
  return InkWell(
    onTap: () => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => messaging(data['donor'], number),
      ),
    ),
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Date : ${formatTime(data['createdAt'])}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Location : 123, XYZ Apt',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'By ${data['donor'].substring(0, 10)}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Qty: 0.${data['qty']}ml',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
