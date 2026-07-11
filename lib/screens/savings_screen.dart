import 'package:flutter/material.dart';

class SavingsScreen extends StatelessWidget {
  const SavingsScreen({super.key});

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
              // HEADER
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
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const Icon(Icons.savings, color: Colors.white, size: 45),

                    const SizedBox(height: 15),

                    const Text(
                      "My Savings",

                      style: TextStyle(
                        color: Colors.white,

                        fontSize: 28,

                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "Build your financial future with Ihute Ride",

                      style: TextStyle(color: Colors.white.withOpacity(.85)),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // BALANCE CARD
              Container(
                padding: const EdgeInsets.all(22),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(22),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.06),

                      blurRadius: 15,
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const Text(
                      "Total Savings",

                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      "0 RWF",

                      style: TextStyle(
                        fontSize: 35,

                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,

                      height: 50,

                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),

                        onPressed: () {},

                        child: const Text(
                          "Add Savings",

                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "Savings Goals",

                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              goalCard(
                Icons.motorcycle,

                "Buy Your Own Bike",

                "0% completed",

                Colors.orange,
              ),

              goalCard(
                Icons.home,

                "Personal Growth",

                "0% completed",

                Colors.green,
              ),

              const SizedBox(height: 30),

              const Text(
                "Recent Transactions",

                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              transactionCard(
                Icons.add_circle,

                "No transactions yet",

                "Start saving to see activity",
              ),

              const SizedBox(height: 30),

              Container(
                padding: const EdgeInsets.all(18),

                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(.1),

                  borderRadius: BorderRadius.circular(20),
                ),

                child: Row(
                  children: [
                    const Icon(Icons.lightbulb, color: primaryColor, size: 35),

                    const SizedBox(width: 15),

                    Expanded(
                      child: Text(
                        "Small savings today can create bigger opportunities tomorrow.",

                        style: TextStyle(color: Colors.blue.shade900),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget goalCard(IconData icon, String title, String progress, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),

      padding: const EdgeInsets.all(18),

      decoration: cardDecoration(),

      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(.15),

            child: Icon(icon, color: color),
          ),

          const SizedBox(width: 15),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),

              Text(progress, style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  Widget transactionCard(IconData icon, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(18),

      decoration: cardDecoration(),

      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.history)),

        title: Text(title),

        subtitle: Text(subtitle),
      ),
    );
  }

  BoxDecoration cardDecoration() {
    return BoxDecoration(
      color: Colors.white,

      borderRadius: BorderRadius.circular(20),

      boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(.06), blurRadius: 12),
      ],
    );
  }
}
