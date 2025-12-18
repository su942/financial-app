import 'package:flutter/material.dart';
import '../auth/auth_service.dart';
import '../core/services/profile_service.dart';
import '../models/user_model.dart';
import 'profile_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _authService = AuthService();
  final _profileService = ProfileService();
  UserProfile? _userProfile;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  _loadProfile() async {
    final user = _authService.currentUser;
    if (user != null) {
      final profile = await _profileService.getUserProfile(user.uid);
      setState(() {
        _userProfile = profile;
      });
    }
  }

  void _logout() async {
    await _authService.signOut();
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          if (_userProfile != null)
            UserAccountsDrawerHeader(
              accountName: Text(_userProfile?.displayName ?? 'User'),
              accountEmail: Text(_userProfile?.phoneNumber ?? ''),
              currentAccountPicture: CircleAvatar(
                child:
                    Text((_userProfile?.displayName ?? 'U')[0].toUpperCase()),
              ),
              decoration: BoxDecoration(color: Colors.grey[900]),
            ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile Settings'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(context,
                      MaterialPageRoute(builder: (c) => ProfileScreen()))
                  .then((_) => _loadProfile());
            },
          ),
          const Divider(),
          const ListTile(
              leading: Icon(Icons.key), title: Text('Gemini API Key')),
          const ListTile(leading: Icon(Icons.palette), title: Text('Theme')),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout', style: TextStyle(color: Colors.red)),
            onTap: _logout,
          ),
        ],
      ),
    );
  }
}
