import 'package:flutter/material.dart';
import 'package:pro/Models/user.dart';
import 'package:pro/services/Auth/auth_services.dart';
import 'package:pro/services/database/database_provider.dart';
import 'package:provider/provider.dart';

/*
   PROFILE PAGE

   This is a profile page for a given uid
 */
class ProfilePage extends StatefulWidget {
  //user id
  final String uid;

  const ProfilePage({
    super.key,
    required this.uid,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //providers
  late final databaseProvider =
      Provider.of<DatabaseProvider>(context, listen: false);

  //user info
  UserProfile? user;
  String currentUserId = AuthService().getCurrentUid();

  //loading
  bool _isLoading = true;

  //on startup
  @override
  void initState() {
    super.initState();
    //let's the user info
    loadUser();
  }

  Future<void> loadUser() async {
    //get user profile info
    user = await databaseProvider.userProfile(widget.uid);

    //finished loading
    setState(() {
      _isLoading = false;
    });
  }

  //BUILD UI
  @override
  Widget build(BuildContext context) {
    // SCAFFOLD
    return Scaffold(
      // App Bar
      appBar: AppBar(
        title: Center(
            child:
                Text(_isLoading || user == null ? 'Loading...' : user!.name)),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: const [
                //username handle

                //profile picture

                //profile status->number of post/followers/following

                //follow/unfollow

                //bio box

                //list of post from user
              ],
            ),
    );
  }
}
