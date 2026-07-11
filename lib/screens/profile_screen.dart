import 'package:flutter/material.dart';
import 'sign_in_screen.dart';

class ProfileScreen extends StatelessWidget {
  final String userName;

  const ProfileScreen({super.key, required this.userName});

  static const Color primaryColor = Color(0xFF2563EB);

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
                      userName,

                      style: const TextStyle(
                        color: Colors.white,

                        fontSize: 26,

                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        const Icon(
                          Icons.verified,

                          color: Colors.white,

                          size: 18,
                        ),

                        const SizedBox(width: 5),

                        Text(
                          "Verified Rider",

                          style: TextStyle(color: Colors.white.withOpacity(.9)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "Personal Information",

                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              profileCard(Icons.person, "Full Name", userName),

              profileCard(Icons.phone, "Phone Number", "+250 XXX XXX XXX"),

              profileCard(Icons.work, "Occupation", "Professional Rider"),

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

                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,

                      MaterialPageRoute(builder: (_) => const SignInScreen()),

                      (route) => false,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileCard(IconData icon, String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(18),
      ),

      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: primaryColor.withOpacity(.15),

            child: Icon(icon, color: primaryColor),
          ),

          const SizedBox(width: 15),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(title, style: const TextStyle(color: Colors.grey)),

              Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ],
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
}
