import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseHelper {
  static FirebaseFirestore db = FirebaseFirestore.instance;

//returning user data working fine
  Future<List<String>> getdata(String number) async {
    try {
      List<String> info = [];
      var data =
          await db.collection("users").where("number", isEqualTo: number).get();
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
      if (data.docs.length > 0) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  // add request for blood
  bool addrequest(String user, String patientBlood, String patientGender,
      String PatientRelation, String PatientAge, String status) {
    try {
      final request = {
        "name": user,
        "patientBlood": patientBlood,
        "patientGender": patientGender,
        "patientRelation": PatientRelation,
        "patientAge": PatientAge,
        "status": status
      };
      db
          .collection("requests")
          .doc()
          .set(request)
          .onError((error, stackTrace) => print("Error"));
      return true;
    } catch (e) {
      return false;
    }
  }

  // return all users who have requested to donate except accepted requests
  Stream<List<String>> getrequestedusers() {
    var data =
        db.collection("requests").where("status", isEqualTo: "requested").get();
    return data as Stream<List<String>>;
  }

  // void getDetails() async {
  //   var colloctiondata = await db.collection('users').get();
  //   print(colloctiondata.docs);
  //   for (var element in colloctiondata.docs) {
  //     var data = element.data();
  //     print(data['number']);
  //   }
  // }
}
