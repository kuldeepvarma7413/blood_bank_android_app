import 'package:blood_bank/NumberAuthentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseHelper {
  static FirebaseFirestore db = FirebaseFirestore.instance;

//returning user data
  Future<List<String>> getdata(String? number) async {
    try {
      List<String> info = [];
      var data =
          await db.collection("users").where("number", isEqualTo: number).get();
      // ignore: avoid_function_literals_in_foreach_calls
      data.docs.forEach((element) {
        info.add(element['name']);
        info.add(element['dob']);
        info.add(element['age']);
        info.add(element['healthConditions']);
        info.add(element['bloodGroup']);
        info.add(element['number']);
      });
      return info;
    } catch (e) {
      return [];
    }
  }

//returning request data
  Future<List<String>> getrequestdata(String number) async {
    try {
      List<String> info = [];
      var data = await db
          .collection("requests")
          .where("number", isEqualTo: number)
          .get();
      // ignore: avoid_function_literals_in_foreach_calls
      data.docs.forEach((element) {
        info.add(element['name']);
        info.add(element['patientBlood']);
        info.add(element['patientAge']);
        info.add(element['patientGender']);
        info.add(element['patientRelation']);
        info.add(element['number']);
      });
      return info;
    } catch (e) {
      return [];
    }
  }

//  update request after acceptance
  Future<bool> isRequestUpdated(
      List<String> data, String? number1, String? number2) async {
    try {
      var id = "";
      await db
          .collection('requests')
          .where("number", isEqualTo: number1)
          .get()
          .then(
            (QuerySnapshot snapshot) => {
              // ignore: avoid_function_literals_in_foreach_calls
              snapshot.docs.forEach((f) {
                id = f.reference.id;
              }),
            },
          );
      db
          .collection("requests")
          .doc(id)
          .update({"status": "accepted", "donor": number2}).onError(
              // ignore: avoid_print
              (error, stackTrace) => print("Error"));
      return true;
    } catch (e) {
      return false;
    }
  }

  // adding new user

  bool addUser(String age, String bdgroup, String dob, String healthCondition,
      String name, String number) {
    try {
      final user = {
        "name": name,
        "number": number,
        "age": age,
        "bloodGroup": bdgroup,
        "dob": dob,
        "healthConditions": healthCondition,
      };
      db
          .collection("users")
          .doc()
          .set(user)
          // ignore: avoid_print
          .onError((error, stackTrace) => print("Error"));
      return true;
    } catch (e) {
      return false;
    }
  }

  // get mobile number to check user existance to login else signup
  Future<bool> getExistance(String number) async {
    try {
      var data =
          await db.collection("users").where("number", isEqualTo: number).get();
      if (data.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  // add request for blood
  Future<bool> addrequest(
      String user,
      String patientBlood,
      String patientGender,
      // ignore: non_constant_identifier_names
      String PatientRelation,
      // ignore: non_constant_identifier_names
      String PatientAge,
      String number) async {
    try {
      final request = {
        "name": user,
        "patientBlood": patientBlood,
        "patientGender": patientGender,
        "patientRelation": PatientRelation,
        "patientAge": PatientAge,
        "status": "requested",
        "number": number,
        "requested_by": number,
        "donor": "",
        "createdAt": DateTime.now().millisecondsSinceEpoch.toString(),
        // "qty": _quantityController.text.trim(),
        "qty": 0.2
      };
      if (await isRequestAlreadyExist(number)) {
        return false;
      } else {
        db
            .collection("requests")
            .doc()
            .set(request)
            // ignore: avoid_print
            .onError((error, stackTrace) => print("Error"));
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  // get mobile number to check request existance to avoid multiple request from one user
  Future<bool> isRequestAlreadyExist(String number) async {
    try {
      var data = await db
          .collection("requests")
          .where("number", isEqualTo: number)
          // .where("status", isNotEqualTo: "requested")
          .get();
      if (data.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

// return contact number of all requested users
  Future<List<String>> getrequestedusers(String? number) async {
    try {
      List<String> info = [];
      var data = await db
          .collection("requests")
          .where("status", isEqualTo: "requested")
          .get();
      // ignore: avoid_function_literals_in_foreach_calls
      data.docs.forEach((element) {
        if (element['number'] != number) {
          info.add(element['number']);
        }
      });
      return info;
    } catch (e) {
      return [];
    }
  }

  // delete existing request of logged in user
  void deleteCurrentRequest(String number) async {
    var id = "";
    await db
        .collection('requests')
        .where("number", isEqualTo: number)
        .get()
        .then(
          (QuerySnapshot snapshot) => {
            // ignore: avoid_function_literals_in_foreach_calls
            snapshot.docs.forEach((f) {
              id = f.reference.id;
              db.collection("requests").doc(id).delete();
            }),
          },
        );
  }

  Future sendMessage(
      String receiverId, String message, List<String> data) async {
    // create a message object
    MessageModel msg = MessageModel(
      content: message,
      createAt: DateTime.now().millisecondsSinceEpoch.toString(),
      receiverId: receiverId,
      senderId: NumberAuthentication.number,
      senderName: data[0],
    );

    // list of ids
    List<String> ids = [receiverId, NumberAuthentication.number];
    ids.sort(); // sort to create only 1 chat room between 2 users

    // create chat room id
    String chatRoomId = ids.join("_");

    // create a chat room and add message to it
    db
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .add(msg.toMap());

    // add participants to chat room
    db
        .collection("chat_rooms")
        .doc(chatRoomId)
        .set({'participants': ids}, SetOptions(merge: true));
  }

  // get messages
  Stream<QuerySnapshot> getMessages(String receiverId) {
    // construct chatroom id
    List<String> ids = [NumberAuthentication.number, receiverId];

    // sort to ensure that the chat room id is always the same for 2 user
    ids.sort();

    // combine the ids with an underscore to create a chat room id
    String chatRoomId = ids.join('_');

    // find chatroom
    return db
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  // all contacts connected on message
  Stream<QuerySnapshot> getContacts(String number) {
    return db
        .collection('chat_rooms')
        .where("participants", arrayContains: number)
        .snapshots();
  }
}

class MessageModel {
  String content;
  String createAt;
  String receiverId;
  String senderId;
  String senderName;

  MessageModel({
    required this.content,
    required this.createAt,
    required this.receiverId,
    required this.senderId,
    required this.senderName,
  });

  // convert to map
  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'senderName': senderName,
      'receiverId': receiverId,
      'content': content,
      'createdAt': createAt
    };
  }
}
