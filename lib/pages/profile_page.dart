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
  final String uid;

  const ProfilePage(
      {super.key, required this.uid, required VoidCallback toggleTheme});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final DatabaseProvider databaseProvider;
  UserProfile? user;
  String currentUserId = AuthService().getCurrentUid();
  bool _isLoading = true;

  // Text controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    databaseProvider = Provider.of<DatabaseProvider>(context, listen: false);
    loadUser();
  }

  Future<void> loadUser() async {
    try {
      user = await databaseProvider.getUserProfile(widget.uid);
      if (user != null) {
        _nameController.text = user!.name;
        _emailController.text = user!.email;
      }
    } catch (e) {
      print('Error loading user: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _logout() async {
    await AuthService().logout();
    Navigator.pushReplacementNamed(context, '/login'); // Use defined route
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isLoading || user == null ? 'Loading...' : 'Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Profile Picture and Edit Icon
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: user != null
                              ? AssetImage(
                                  'assets/profile_placeholder.png') // replace with actual image
                              : null, // Show placeholder image or nothing
                          child:
                              user == null ? CircularProgressIndicator() : null,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: IconButton(
                            icon: const Icon(Icons.edit, color: Colors.white),
                            onPressed: () {
                              // Implement logic to change the profile picture
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Name and Email Display with null checks
                  if (user != null) ...[
                    Text(
                      user!.name,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      user!.email,
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ] else ...[
                    const Text('Loading Name...'),
                    const Text('Loading Email...'),
                  ],

                  const SizedBox(height: 30),

                  // General Settings Buttons
                  _buildSettingsButton(
                    icon: Icons.support,
                    label: 'Help & Support',
                    onTap: () {
                      // Navigate to Help & Support
                    },
                  ),
                  _buildSettingsButton(
                    icon: Icons.brightness_6,
                    label: 'App Theme',
                    onTap: () {
                      // Implement theme change logic
                    },
                  ),
                  _buildSettingsButton(
                    icon: Icons.logout,
                    label: 'Logout',
                    onTap: _logout,
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildSettingsButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}
