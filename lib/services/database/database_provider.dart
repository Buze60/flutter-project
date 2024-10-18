// ignore_for_file: unused_field, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:pro/Models/user.dart';
import 'package:pro/services/Auth/auth_services.dart';
import 'package:pro/services/database/database_service.dart';

/*
   DATABASE PROVIDER
   This provider is to separate the firestore data handling and UI of our App

   -the database service class handles data to and from firebase
   -the database provider class processes the data to display in our app

   this make our code much more modular,easer and cleaner to read and test.
  particularly as the number of page grow, we need this provider to properly manage
  the different states of the app.

  also, if one day we decide to change our backend(from firebase to something else )
  then it is much easer to do manage and switch out different database.
 */
class DatabaseProvider extends ChangeNotifier {
  /*
  SERVICES
  */
  //get the db & Auth service
  final _Auth = AuthService();
  final _db = DatabaseService();
  /*
  USER PROFILE
  */
  //get user profile with given uid
  Future<UserProfile?> userProfile(String uid) => _db.getUserFromFirebase(uid);
}
