import 'package:flutter/foundation.dart';
import 'package:pro/Models/user.dart';
import 'package:pro/services/database/database_service.dart';

class DatabaseProvider extends ChangeNotifier {
  final DatabaseService _databaseService = DatabaseService();

  // CREATE: Save new user profile
  Future<void> saveUserProfile(String name, String email, String role) {
    return _databaseService.saveUserInfoInFirebase(
      name: name,
      email: email,
      role: role,
    );
  }

  // READ: Get user profile by UID
  Future<UserProfile?> getUserProfile(String uid) {
    return _databaseService.getUserFromFirebase(uid);
  }

  // UPDATE: Update user profile
  Future<void> updateUserProfile(UserProfile userProfile) {
    return _databaseService.updateUserInFirebase(userProfile);
  }

  // DELETE: Delete user profile by UID
  Future<void> deleteUserProfile(String uid) {
    return _databaseService.deleteUserFromFirebase(uid);
  }

// retun the number of admin in the database
  // Future getAdminCount() async {
  //   return _adminDB.getAdminCount();
  // }
}
