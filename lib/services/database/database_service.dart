// ignore_for_file: non_constant_identifier_names, avoid_print, body_might_complete_normally_nullable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pro/Models/user.dart';

import '../../Models/ticket_request.dart';
/*
  DATABASE SERVICE
  this class handle all the data from and on the firebase
  _______________________________________________________________
  -user profile
  -post message
  -like
  -comment
  -account staff(report/delete account and block)
  -follow unfollow
  -search user
 */

class DatabaseService {
  //get the instance of firestore db and Auth
  final _db = FirebaseFirestore.instance;
  final _Auth = FirebaseAuth.instance;

  /*
  USER PROFILE
  when the user register the we can create an account so lates also store
  their details in the databse to display their profile page
  */
  //save user info
  Future<void> saveUserInfoInFirebase(
      {required String name,
      required String role,
      required String email}) async {
    //get the current uid
    String uid = _Auth.currentUser!.uid;
    //Extract the username from the email
    String username = email.split('@')[0];
    //create user profile
    UserProfile user = UserProfile(
        uid: uid,
        name: name,
        email: email,
        username: username,
        skill: '',
        role: role);
    //convert user user into a map
    final userMap = user.toMap();
    //save user info to the firebase
    await _db.collection("Users").doc(uid).set(userMap);
  }

//ticket to save in the database
//________________________________________________________________________
  Future<void> saveTicketInfoInFirebase({
    required String title,
    required String description,
    String? ImageUrl,
    required String urgency,
    required String problemType,
    required String requestBy,
  }) async {
    // Firestore auto-generates a unique document ID
    //==========================================================================
    DocumentReference newTicketRef = _db.collection("Request Ticket").doc();
    String ticketID = newTicketRef.id; // Retrieve the generated ticketID
    TicketRequest ticket = TicketRequest(
      ticketID: ticketID,
      title: title,
      description: description,
      urgency: urgency,
      problemType: problemType,
      requestBy: requestBy,
    );
    //convert the data to map
    final ticketmap = ticket.toMap();
    //save into the database
    await _db.collection("Request Ticket").doc().set(ticketmap);
  }

//get list of tickets from the firebase firestore
//____________________________________________________________________________
  // Fetch a list of ticket requests from Firestore
  Future<List<TicketRequest>> getTicketsFromFirebase() async {
    List<TicketRequest> ticketList = [];
    try {
      // Fetch all documents from the 'Request Ticket' collection
      QuerySnapshot querySnapshot = await _db
          .collection('Request Ticket')
          .orderBy('createdAt', descending: true)
          .get();
      if (querySnapshot.docs.isEmpty) {
        print('No tickets found in the collection.');
      }

      // Convert each document to a TicketRequest object
      for (var doc in querySnapshot.docs) {
        ticketList.add(
            TicketRequest.fromdocument(doc.data() as Map<String, dynamic>));
      }
    } catch (e) {
      print('Error fetching tickets: $e');
    }
    return ticketList; // Return the list of tickets
  }

//get specific ticket from the firebase using documnet id
//____________________________________________________________________________
  Future<TicketRequest?> getTicketFromFirebase(String ticketID) async {
    try {
      // Fetch the document using the passed ticketID
      DocumentSnapshot getTicket =
          await _db.collection('Request Ticket').doc(ticketID).get();

      // Check if the document exists
      if (getTicket.exists) {
        print('Document found in Firestore: ${getTicket.id}'); // Debugging line
        return TicketRequest.fromdocument(
            getTicket.data() as Map<String, dynamic>);
      } else {
        print('Document does not exist for ID: $ticketID'); // Debugging line
        return null;
      }
    } catch (e) {
      print('Error fetching ticket: $e'); // Debugging line
      return null;
    }
  }

  //Get user info
  Future<UserProfile?> getUserFromFirebase(String uid) async {
    try {
      //retrieve the user doc from the firebase
      DocumentSnapshot UserDoc = await _db.collection("Users").doc(uid).get();
      //Convert doc to the user profile
      return UserProfile.fromdocument(UserDoc);
    } catch (e) {
      print(e);
      return null;
    }
  }

  /*
  USER MESSAGE
  
  */
  /*
  LIKE
  
  */
  /*
  COMMENTS 
  
  */
  /*
  ACCOUNT STAFF
  
  */
  /*
  FOLLOW
  
  */
}
