import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static Future<bool> addUser(
    BuildContext context,
    String username,
    String id,
    String password,
    String email,
    String contactnumber,
    String program,
    String semester,
    String programLevel,
    String batch,
    String cgpa,
    String maxCreditHours,
    String registeredCreditHours,
    String completedCreditHours,
    String requiredCreditHours,
  ) async {
    id = id.toLowerCase();
    username = username.toUpperCase();
    try {
      CollectionReference users = firestore.collection('users');
      await users.add({
        'username': username,
        'id': id,
        'password': password,
        'email': email,
        'contactnumber': contactnumber,
        'program': program,
        'semester': semester,
        'programLevel': programLevel,
        'batch': batch,
        'cgpa': cgpa,
        'maxCreditHours': maxCreditHours,
        'registeredCreditHours': registeredCreditHours,
        'completedCreditHours': completedCreditHours,
        'requiredCreditHours': requiredCreditHours,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> checkUserExist(String id, String password) async {
    id = id.toLowerCase();
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      QuerySnapshot querySnapshot = await firestore
          .collection('users')
          .where('id', isEqualTo: id)
          .where('password', isEqualTo: password)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> checkRegisterUserExist(String id) async {
    try {
      // ignore: no_leading_underscores_for_local_identifiers
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;
      QuerySnapshot querySnapshot =
          await _firestore.collection('users').where('id', isEqualTo: id).get();
      if (querySnapshot.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static Future<bool> checkRegisterCourseExist(String id) async {
    try {
      // ignore: no_leading_underscores_for_local_identifiers
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;
      QuerySnapshot querySnapshot = await _firestore
          .collection('courses')
          .where('id', isEqualTo: id)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static Future<bool> addCourse(
    BuildContext context,
    String id,
    String title,
    String type,
    String mode,
    String section,
    String credithour,
  ) async {
    try {
      CollectionReference courses = firestore.collection('courses');
      await courses.add({
        'title': title,
        'id': id,
        'credithour': credithour,
        'section': section,
        'type': type,
        'mode': mode,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<Map<String, dynamic>?> getStudentById(String id) async {
  try {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await firestore
        .collection('users')
        .where('id', isEqualTo: id)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs.first.data() as Map<String, dynamic>;
    } else {
      return null;
    }
  } catch (e) {
    print("Error fetching course data: $e");
    return null;
  }
}
  static Future<List<Map<String, dynamic>>> getEnrollmentsByUserId(String userId) async {
    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      QuerySnapshot querySnapshot = await firestore
          .collection('enrollments')
          .where('userId', isEqualTo: userId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
      } else {
        return [];
      }
    } catch (e) {
      print("Error fetching enrollments: $e");
      return [];
    }
  }

}

class Provider1 extends ChangeNotifier {
  bool _obs = true;
  bool get obs => _obs;
  void setvalue() {
    _obs = !_obs;
    notifyListeners();
  }
}

class Provider2 extends ChangeNotifier {
  bool _obs = true;
  bool get obs => _obs;
  void setvalue() {
    _obs = !_obs;
    notifyListeners();
  }
}

class Provider3 extends ChangeNotifier {
  bool _obs = true;
  bool get obs => _obs;
  void setvalue() {
    _obs = !_obs;
    notifyListeners();
  }
}

class Provider4 extends ChangeNotifier {
  bool _obs = true;
  bool get obs => _obs;
  void setvalue() {
    _obs = !_obs;
    notifyListeners();
  }
}
