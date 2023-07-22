import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseHelper {
  static FirebaseFirestore db = FirebaseFirestore.instance;

//returning user data
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

//returning request data
  Future<List<String>> getrequestdata(String number) async {
    try {
      List<String> info = [];
      var data = await db
          .collection("requests")
          .where("number", isEqualTo: number)
          .get();
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
      List<String> data, String number1, String number2) async {
    try {
      var id = "";
      await db
          .collection('requests')
          .where("number", isEqualTo: number1)
          .get()
          .then(
            (QuerySnapshot snapshot) => {
              snapshot.docs.forEach((f) {
                id = f.reference.id;
              }),
            },
          );
      db
          .collection("requests")
          .doc(id)
          .update({"status": "accepted", "acceptedBy": number2}).onError(
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
  Future<bool> addrequest(
      String user,
      String patientBlood,
      String patientGender,
      String PatientRelation,
      String PatientAge,
      String status,
      String number) async {
    try {
      final request = {
        "name": user,
        "patientBlood": patientBlood,
        "patientGender": patientGender,
        "patientRelation": PatientRelation,
        "patientAge": PatientAge,
        "status": status,
        "number": number,
        "acceptedBy": ""
      };
      if (await isRequestAlreadyExist(number)) {
        return false;
      } else {
        db
            .collection("requests")
            .doc()
            .set(request)
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
          .get();
      if (data.docs.length > 0) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

// return contact number of all requested users
  Future<List<String>> getrequestedusers(String number) async {
    try {
      List<String> info = [];
      var data = await db
          .collection("requests")
          .where("status", isEqualTo: "requested")
          .get();
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
            snapshot.docs.forEach((f) {
              id = f.reference.id;
            }),
          },
        );
    await db.collection("requests").doc(id).delete();
  }
}
