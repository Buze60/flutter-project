// ignore_for_file: non_constant_identifier_names

/*
 USER PROFILE

 This is what the user profile should have in their profile
 __________________________________________________________________________________

 - uid
 - name
 - email
 - username
 - profile photo
 - bio
 */

// Let's create the user profile class model
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  final String uid;
  final String name;
  final String role;
  final String email;
  final String username;
  final String bio;

  UserProfile({
    required this.uid,
    required this.name,
    required this.role,
    required this.email,
    required this.username,
    required this.bio,
  });

  /* firebase -> app
     Convert firestore Document to UserProfile (so that we can use it in our app)
  */
  factory UserProfile.fromDocument(DocumentSnapshot doc) {
    return UserProfile(
      uid: doc["uid"],
      name: doc["name"],
      role: doc["role"],
      email: doc["email"],
      username: doc["username"],
      bio: doc["bio"] ?? '', // Default to empty string if bio is null
    );
  }

  // Allow profilePictureUrl to be nullable
  String? get profilePictureUrl => null;

  /*
  app -> firebase
  Convert UserProfile to Map (so that we can store it in firebase)
  */
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'role': role,
      'email': email,
      'username': username,
      'bio': bio,
    };
  }
}
