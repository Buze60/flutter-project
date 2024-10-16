import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pro/Models/user.dart';

class DatabaseService {
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  /*
  CREATE
  Save user info to Firestore
  */
  Future<void> saveUserInfoInFirebase({
    required String name,
    required String email,
    required String role,
  }) async {
    String uid = _auth.currentUser!.uid;
    String username = email.split('@')[0];

    UserProfile user = UserProfile(
      uid: uid,
      name: name,
      role: role,
      email: email,
      username: username,
      bio: '',
    );

    final userMap = user.toMap();
    await _db.collection("Users").doc(uid).set(userMap);
  }

  /*
  READ
  Get user info from Firestore
  */
  Future<UserProfile?> getUserFromFirebase(String uid) async {
    try {
      DocumentSnapshot userDoc = await _db.collection("Users").doc(uid).get();
      return UserProfile.fromDocument(userDoc);
    } catch (e) {
      print("Error fetching user: $e");
      return null;
    }
  }

  /*
  UPDATE
  Update user profile in Firestore
  */
  Future<void> updateUserInFirebase(UserProfile userProfile) async {
    try {
      Map<String, dynamic> userData = userProfile.toMap();
      await _db.collection('Users').doc(userProfile.uid).update(userData);
      print("User profile updated successfully.");
    } catch (e) {
      print("Error updating user profile: $e");
    }
  }

  /*
  DELETE
  Delete user profile from Firestore
  */
  Future<void> deleteUserFromFirebase(String uid) async {
    try {
      await _db.collection('Users').doc(uid).delete();
      print("User profile deleted successfully.");
    } catch (e) {
      print("Error deleting user profile: $e");
    }
  }

  //get the number of admin
  Future<int> getAdminCount() async {
    QuerySnapshot query =
        await _db.collection('Users').where('role', isEqualTo: 'admin').get();

    return query.docs.length; // Returns the number of admin users
  }
}
