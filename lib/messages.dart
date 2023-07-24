import 'package:blood_bank/messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class messages extends StatefulWidget {
  String? number;
  messages(this.number, {super.key});

  @override
  // ignore: no_logic_in_create_state
  State<messages> createState() => _messagesState(number);
}

// ignore: camel_case_types
class _messagesState extends State<messages> {
  String? number;
  _messagesState(this.number) {}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                "Messages",
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
            body: _buildChats(number)));
  }
}

Widget _buildChats(String? number) {
  final firestore = FirebaseFirestore.instance;
  // for each chat room check if the participants array contains the current user
  return StreamBuilder(
    stream: firestore.collection('chat_rooms').snapshots(),
    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasError) {
        return const Center(
          child: Text("Something went wrong"),
        );
      } else if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.redAccent,
          ),
        );
        // ignore: prefer_is_empty
      } else if (snapshot.data!.docs.length == 0) {
        return const Center(
            child: Text(
          "No received messages found!",
          style: TextStyle(fontWeight: FontWeight.w500),
        ));
      } else {
        final chatRooms = snapshot.data!.docs;
        return ListView.builder(
          itemCount: chatRooms.length,
          itemBuilder: (context, index) {
            final chatRoom = chatRooms[index];
            final participants = chatRoom['participants'] as List;
            String otherUserId =
                participants[0] == number ? participants[1] : participants[0];

            if (participants.contains(number)) {
              return messageItem(context, otherUserId, number);
            } else {
              return const SizedBox();
            }
          },
        );
      }
    },
  );
}

Widget messageItem(BuildContext context, String otherUserId, String? number) {
  // show donor id and mss on left side, on right side show a right icon
  return InkWell(
    onTap: () => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return messaging(otherUserId, number);
        },
      ),
    ),
    child: Container(
      // margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
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
              Text(otherUserId.substring(0, 10),
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 10),
              // view details
              Text.rich(
                TextSpan(
                  text: 'Hello, I am available',
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // navigate to details screen
                    },
                ),
              )
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Color(0xffFA4848),
            size: 20,
          )
        ],
      ),
    ),
  );
}
