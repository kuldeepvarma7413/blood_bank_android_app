import 'package:blood_bank/NumberAuthentication.dart';
import 'package:blood_bank/database/db_fun.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types, must_be_immutable
class messaging extends StatefulWidget {
  String receiverId;
  String? number;
  messaging(this.receiverId, this.number);

  @override
  // ignore: no_logic_in_create_state
  State<messaging> createState() => _messagingState(receiverId, number);
}

// ignore: camel_case_types
class _messagingState extends State<messaging> {
  String receiverId = "";
  String? number;
  _messagingState(this.receiverId, this.number);
  final TextEditingController _messageController = TextEditingController();

  void sendMessage() async {
    var message = _messageController.text;

    // trim the message to remove any extra spaces
    message = message.trim();

    if (message.isNotEmpty) {
      var data = await DatabaseHelper().getdata(number);
      DatabaseHelper().sendMessage(receiverId, message, data);
    }
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    receiverId.substring(0, 10),
                    style:
                        const TextStyle(fontFamily: 'poorStory', fontSize: 26),
                  ),
                  const Icon(
                    Icons.call,
                    color: Colors.white,
                    size: 28,
                  )
                ],
              ),
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
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Expanded(
                        child: getRequests(receiverId, number),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height - 800,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: const Color.fromRGBO(255, 130, 130, 1)),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width - 70,
                            child: TextField(
                              controller: _messageController,
                              style: const TextStyle(
                                  color: Color.fromRGBO(255, 130, 130, 1)),
                              decoration: const InputDecoration(
                                  hintText: "Type a message",
                                  hintStyle: TextStyle(
                                      color: Color.fromRGBO(255, 130, 130, 1)),
                                  border: InputBorder.none),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              sendMessage();
                            },
                            child: const Icon(
                              Icons.send,
                              color: Color.fromRGBO(255, 130, 130, 1),
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}

Widget getRequests(String receiverId, String? number) {
  return StreamBuilder(
      stream: DatabaseHelper().getMessages(receiverId),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text("Something went wrong!"));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(color: Colors.redAccent));
        }
        if (snapshot.data!.docs.length == 0) {
          return const Center(
              child: Text(
            "No messages yet!",
            style: TextStyle(color: Colors.black),
          ));
        }

        return ListView.builder(
            reverse: true,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              Map<String, dynamic> data = snapshot.data!.docs[index].data();
              return _messageTile(data, number);
            });
      });
}

String formatTime(String timestamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
  final now = DateTime.now();
  final diff = now.difference(date);
  if (diff.inDays == 0) {
    return DateFormat('hh:mm a').format(date);
  } else {
    return DateFormat('dd/MM HH:mm').format(date);
  }
}

Widget _messageTile(Map<String, dynamic> data, String? number) {
  final userId = number;
  var isMe = data['senderId'] == userId;

  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    padding: const EdgeInsets.symmetric(vertical: 2),
    child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          chatBubble(data['content'], isMe, data['senderId']),
          Text(
            // convert time stamp to hh:mm am/pm format
            formatTime(data['createdAt']),
            style: const TextStyle(fontSize: 12),
          ),
        ]),
  );
}

Widget chatBubble(message, isMe, String id) {
  return Row(
    mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
    children: [
      Flexible(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 0,
                maxWidth: MediaQuery.of(context).size.width * 0.65,
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                decoration: BoxDecoration(
                  color: isMe ? Colors.redAccent : Colors.grey[350],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  message,
                  style: TextStyle(
                      color: isMe ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}
