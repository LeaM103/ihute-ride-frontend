import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'sign_in_screen.dart';

class ProfileScreen extends StatefulWidget {
  final String userId;
  final String userName;

  const ProfileScreen({
    super.key,
    required this.userId,
    required this.userName,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  static const Color primaryColor = Color(0xFF2563EB);

  static const String baseUrl = "http://192.168.1.72:5000";

  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _occupationController;

  bool _isSaving = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              // PROFILE HEADER
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(25),

                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2563EB), Color(0xFF1D4ED8)],
                  ),

                  borderRadius: BorderRadius.circular(25),
                ),

                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.white,

                      child: Icon(Icons.person, size: 55, color: primaryColor),
                    ),

                    const SizedBox(height: 15),

                    Text(
                      _nameController.text,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Icon(Icons.verified, color: Colors.white, size: 18),

                        SizedBox(width: 5),

                        Text(
                          "Verified Rider",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "Edit Profile",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              profileField(
                controller: _nameController,
                label: "Full Name",
                icon: Icons.person,
              ),

              const SizedBox(height: 15),

              profileField(
                controller: _phoneController,
                label: "Phone Number",
                icon: Icons.phone,
                keyboard: TextInputType.phone,
              ),

              const SizedBox(height: 15),

              profileField(
                controller: _occupationController,
                label: "Occupation",
                icon: Icons.work,
              ),

              const SizedBox(height: 30),

              const Text(
                "Account Settings",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              settingCard(Icons.lock, "Change Password"),

              settingCard(Icons.notifications, "Notifications"),

              settingCard(Icons.help, "Help & Support"),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton.icon(
                  onPressed: _isSaving ? null : _saveProfile,

                  icon: _isSaving
                      ? const SizedBox(
                          height: 18,
                          width: 18,

                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Icon(Icons.save, color: Colors.white),

                  label: Text(
                    _isSaving ? "Saving..." : "Save Changes",

                    style: const TextStyle(color: Colors.white, fontSize: 17),
                  ),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,

                      MaterialPageRoute(builder: (_) => const SignInScreen()),

                      (route) => false,
                    );
                  },

                  icon: const Icon(Icons.logout, color: Colors.white),

                  label: const Text(
                    "Logout",

                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _occupationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController(text: widget.userName);
    _phoneController = TextEditingController();
    _occupationController = TextEditingController();

    _nameController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  Widget profileField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboard = TextInputType.text,
  }) {
    return TextField(
      controller: controller,

      keyboardType: keyboard,

      decoration: InputDecoration(
        labelText: label,

        prefixIcon: Icon(icon),

        filled: true,

        fillColor: Colors.white,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),

          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget settingCard(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(18),
      ),

      child: Row(
        children: [
          Icon(icon, color: primaryColor),

          const SizedBox(width: 15),

          Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),

          const Spacer(),

          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }

  Future<void> _saveProfile() async {
    setState(() {
      _isSaving = true;
    });

    try {
      final response = await http.put(
        Uri.parse("$baseUrl/api/auth/update-profile/${widget.userId}"),

        headers: {"Content-Type": "application/json"},

        body: jsonEncode({
          "name": _nameController.text.trim(),

          "phone": _phoneController.text.trim(),

          "occupation": _occupationController.text.trim(),
        }),
      );

      if (!mounted) return;

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(data["message"] ?? "Profile updated"),

            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.body), backgroundColor: Colors.red),
        );
      }
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Connection error: $e"),

          backgroundColor: Colors.red,
        ),
      );
    }

    if (mounted) {
      setState(() {
        _isSaving = false;
      });
    }
  }
}
