import 'package:flutter/material.dart';
import 'sign_in_screen.dart';

class HomeScreen extends StatelessWidget {
  final String userName;

  const HomeScreen({super.key, required this.userName});

  static const Color primaryColor = Color(0xFF2563EB);
  static const Color darkBlue = Color(0xFF0F172A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      body: SafeArea(
        child: Center(
          child: Container(
            width: 390,
            constraints: const BoxConstraints(minHeight: 850),

            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  // ================= HEADER =================
                  Container(
                    padding: const EdgeInsets.all(20),

                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF2563EB), Color(0xFF1D4ED8)],
                      ),

                      borderRadius: BorderRadius.circular(28),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(.25),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Image.asset(
                              "assets/ihute_logo.png",
                              height: 55,

                              errorBuilder: (_, __, ___) {
                                return const Icon(
                                  Icons.motorcycle,
                                  size: 45,
                                  color: Colors.white,
                                );
                              },
                            ),

                            Container(
                              padding: const EdgeInsets.all(10),

                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(.2),
                                shape: BoxShape.circle,
                              ),

                              child: const Icon(
                                Icons.notifications,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        Text(
                          "Welcome back 👋",
                          style: TextStyle(
                            color: Colors.white.withOpacity(.9),
                            fontSize: 16,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          userName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          "Empowering riders through savings,\ninsurance and opportunities.",
                          style: TextStyle(color: Colors.white70, height: 1.4),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // ================= PROFILE =================
                  Container(
                    padding: const EdgeInsets.all(18),

                    decoration: cardDecoration(),

                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 32,

                          backgroundColor: primaryColor.withOpacity(.15),

                          child: const Icon(
                            Icons.person,
                            size: 35,
                            color: primaryColor,
                          ),
                        ),

                        const SizedBox(width: 15),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                userName,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 5),

                              const Text(
                                "Professional Rider",
                                style: TextStyle(color: Colors.grey),
                              ),

                              const SizedBox(height: 8),

                              Row(
                                children: [
                                  const Icon(
                                    Icons.verified,
                                    color: Colors.green,
                                    size: 18,
                                  ),

                                  const SizedBox(width: 5),

                                  Text(
                                    "Verified Account",
                                    style: TextStyle(
                                      color: Colors.green.shade700,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  sectionTitle("Account Summary"),

                  const SizedBox(height: 15),

                  Row(
                    children: [
                      Expanded(
                        child: summaryCard(
                          Icons.savings,
                          "Savings",
                          "0 RWF",
                          Colors.green,
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: summaryCard(
                          Icons.security,
                          "Insurance",
                          "Active",
                          Colors.blue,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      Expanded(
                        child: summaryCard(
                          Icons.motorcycle,
                          "Bike",
                          "Not Owned",
                          Colors.orange,
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: summaryCard(
                          Icons.star,
                          "Rating",
                          "5.0",
                          Colors.amber,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  sectionTitle("Services"),

                  const SizedBox(height: 15),

                  GridView.count(
                    shrinkWrap: true,

                    physics: const NeverScrollableScrollPhysics(),

                    crossAxisCount: 2,

                    crossAxisSpacing: 15,

                    mainAxisSpacing: 15,

                    children: [
                      serviceCard(Icons.security, "Insurance", Colors.blue),

                      serviceCard(Icons.savings, "Savings", Colors.green),

                      serviceCard(Icons.motorcycle, "Buy Bike", Colors.orange),

                      serviceCard(Icons.campaign, "Advertise", Colors.purple),
                    ],
                  ),

                  const SizedBox(height: 30),

                  sectionTitle("Quick Actions"),

                  const SizedBox(height: 15),

                  actionCard(
                    Icons.account_balance_wallet,
                    "Start Saving",
                    "Build your financial future",
                  ),

                  actionCard(
                    Icons.directions_bike,
                    "Find Bike Opportunities",
                    "Explore available bikes",
                  ),

                  actionCard(
                    Icons.health_and_safety,
                    "Manage Insurance",
                    "Protect yourself while working",
                  ),

                  const SizedBox(height: 30),

                  sectionTitle("Recent Activity"),

                  const SizedBox(height: 15),

                  activityCard(
                    Icons.check_circle,
                    "Account Created",
                    "Welcome to Ihute Ride",
                    Colors.green,
                  ),

                  activityCard(
                    Icons.login,
                    "Successful Login",
                    "You logged into your account",
                    primaryColor,
                  ),

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

                          MaterialPageRoute(
                            builder: (_) => const SignInScreen(),
                          ),

                          (route) => false,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ================= COMPONENTS =================

  Widget sectionTitle(String text) {
    return Text(
      text,

      style: const TextStyle(
        fontSize: 22,

        fontWeight: FontWeight.bold,

        color: darkBlue,
      ),
    );
  }

  Widget summaryCard(IconData icon, String title, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(15),

      decoration: cardDecoration(),

      child: Column(
        children: [
          Icon(icon, color: color, size: 32),

          const SizedBox(height: 10),

          Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),

          Text(title, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget serviceCard(IconData icon, String title, Color color) {
    return Container(
      decoration: cardDecoration(),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          CircleAvatar(
            radius: 28,

            backgroundColor: color.withOpacity(.15),

            child: Icon(icon, color: color, size: 32),
          ),

          const SizedBox(height: 12),

          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget actionCard(IconData icon, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),

      padding: const EdgeInsets.all(15),

      decoration: cardDecoration(),

      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: primaryColor.withOpacity(.12),

            child: Icon(icon, color: primaryColor),
          ),

          const SizedBox(width: 15),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),

              Text(subtitle, style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  Widget activityCard(
    IconData icon,
    String title,
    String subtitle,
    Color color,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),

      padding: const EdgeInsets.all(15),

      decoration: cardDecoration(),

      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(.15),

          child: Icon(icon, color: color),
        ),

        title: Text(title),

        subtitle: Text(subtitle),
      ),
    );
  }

  BoxDecoration cardDecoration() {
    return BoxDecoration(
      color: Colors.white,

      borderRadius: BorderRadius.circular(22),

      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.06),

          blurRadius: 15,

          offset: const Offset(0, 5),
        ),
      ],
    );
  }
}
