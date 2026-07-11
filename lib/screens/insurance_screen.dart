import 'package:flutter/material.dart';

class InsuranceScreen extends StatelessWidget {
  const InsuranceScreen({super.key});

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
              Container(
                padding: const EdgeInsets.all(25),

                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2563EB), Color(0xFF1D4ED8)],
                  ),

                  borderRadius: BorderRadius.circular(25),
                ),

                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Icon(
                      Icons.health_and_safety,
                      color: Colors.white,
                      size: 45,
                    ),

                    SizedBox(height: 15),

                    Text(
                      "Rider Insurance",

                      style: TextStyle(
                        color: Colors.white,

                        fontSize: 28,

                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 8),

                    Text(
                      "Protection and security for every rider",

                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              insuranceCard(),

              const SizedBox(height: 25),

              const Text(
                "Coverage Benefits",

                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              benefitCard(
                Icons.local_hospital,
                "Medical Support",
                "Get support when you need it",
              ),

              benefitCard(
                Icons.security,
                "Accident Protection",
                "Stay protected while working",
              ),

              benefitCard(
                Icons.family_restroom,
                "Family Support",
                "Protection for your loved ones",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget insuranceCard() {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(22),

        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.06), blurRadius: 15),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.green,

                child: Icon(Icons.check, color: Colors.white),
              ),

              const SizedBox(width: 15),

              const Text(
                "Insurance Active",

                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          const SizedBox(height: 20),

          const Text(
            "Premium Rider Protection Plan",

            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 15),

          ElevatedButton(
            onPressed: () {},

            style: ElevatedButton.styleFrom(backgroundColor: primaryColor),

            child: const Text(
              "Manage Insurance",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget benefitCard(IconData icon, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),

      padding: const EdgeInsets.all(15),

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
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),

              Text(subtitle, style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}
