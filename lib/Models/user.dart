// ignore_for_file: non_constant_identifier_names

/*
 
 USER PROFILE

 this is what the user profile should have in their profile
 __________________________________________________________________________________

 -uid
 -name
 -email
 -Username
 -Profile photo
 -bio

 */
// lets create the user profile class model
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  final String uid;
  final String name;
  final String role;
  final String email;
  final String username;
  final String skill;

  UserProfile(
      {required this.uid,
      required this.name,
      required this.role,
      required this.email,
      required this.username,
      required this.skill});
  /* firebase -> app
     Convert firestore Document to user Profile(so that we can use in our app)
  */
  factory UserProfile.fromdocument(DocumentSnapshot Doc) {
    return UserProfile(
        uid: Doc['uid'],
        name: Doc['name'],
        role: Doc['role'],
        email: Doc['email'],
        username: Doc['username'],
        skill: Doc['skill']);
  }
  /*
  app -> firebase
  Convert UserProfile To Map(so that we can store in firebase)
  */
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'role': role,
      'email': email,
      'username': username,
      'skill': skill
    };
  }
}
