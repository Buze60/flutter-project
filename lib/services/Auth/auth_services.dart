// ignore_for_file: non_constant_identifier_names

/*
    AUTHENTICATION SERVICE
     this handles everything to do with authentication in firebase
    _____________________________________________________________________
    -Login
    -register
    -Logout
    -Delete account (required if you want to published in the app store)

 */
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //get instance of the authentication
  final _auth = FirebaseAuth.instance;
  //get current user and uid
  User? getCurrentUser() => _auth.currentUser;
  String getCurrentUid() => _auth.currentUser!.uid;
  //login -> emial & pw
  Future<UserCredential> loginEmailPassword(String email, password) async {
    //try to login
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    }
    //catch any error
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //register with emil and pw
  Future<UserCredential> registerEmailPassword(String email, password) async {
    //try to register
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //logout
  Future<void> logout() async {
    await _auth.signOut();
  }
  //delete account
}
