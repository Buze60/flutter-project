import 'package:flutter/material.dart';
import 'package:pro/component/my_drawer_tile.dart';
import 'package:pro/component/my_ticket_request.dart';
import 'package:pro/pages/profile_page.dart';
import 'package:pro/pages/requested_ticket.dart';
import 'package:pro/pages/setting_page.dart';
import 'package:pro/services/Auth/auth_services.dart';

/*
   THIS DRAWER IS THE MAIN DARWE
     access at the left isde of the app bar
  _____________________________________________________________________________
 contain 5 main option
    Home
    Profile
    Setting
    Saerching
    Logout
 */
class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});
  //access the auth service
  final _auth = AuthService();
  //logout methed
  void logout() async {
    //tyr to logout
    _auth.logout();
  }

//Build UI
  @override
  Widget build(BuildContext context) {
    //Drawer
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              //APP LOGO
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: Icon(
                  Icons.person,
                  size: 75,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              //DEVIDER
              Divider(
                color: Theme.of(context).colorScheme.secondary,
              ),
              const SizedBox(
                height: 10,
              ),
              //home list tile
              MyDrawerTile(
                title: 'H o m e',
                icon: Icons.home,
                onTap: () {
                  //pop menu navuaget to the home page since we are in the home page
                  Navigator.pop(context);
                },
              ),
              MyDrawerTile(
                title: "p r o f i l e",
                icon: Icons.person,
                onTap: () {
                  //pop menu drawer
                  Navigator.pop(context);
                  //Navigate to the profile page
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProfilePage(uid: _auth.getCurrentUid())));
                },
              ),

              //profile list tile
              MyDrawerTile(
                title: 'S e t t i n g',
                icon: Icons.settings,
                onTap: () {
                  //Pop menu darwer
                  Navigator.pop(context);
                  //go to the setting page
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingPage()));
                },
              ),
              MyDrawerTile(
                title: 'B O O K I N G  N E W',
                icon: Icons.book_online,
                onTap: () {
                  //Pop menu darwer
                  Navigator.pop(context);
                  //go to the setting page
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RequestTicketPage()));
                },
              ),
              MyDrawerTile(
                title: 'T I C K E T  L I S T',
                icon: Icons.line_style_outlined,
                onTap: () {
                  //Pop menu darwer
                  Navigator.pop(context);
                  //go to the setting page
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RequestedTicket()));
                },
              ),
              //setting list tile
              const Spacer(),
              //Logout list tile
              MyDrawerTile(
                  title: "L O G O T", icon: Icons.logout, onTap: logout),
            ],
          ),
        ),
      ),
    );
  }
}
