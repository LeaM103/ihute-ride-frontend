import 'package:flutter/material.dart';

class BikeScreen extends StatelessWidget {
  const BikeScreen({super.key});

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
                    Icon(Icons.motorcycle, color: Colors.white, size: 45),

                    SizedBox(height: 15),

                    Text(
                      "Bike Marketplace",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 8),

                    Text(
                      "Own your bike and grow your riding career",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                "Available Bikes",

                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              bikeCard("TVS Motorcycle", "2,000,000 RWF", "50,000 RWF/month"),

              bikeCard(
                "Yamaha Motorcycle",
                "2,500,000 RWF",
                "65,000 RWF/month",
              ),

              const SizedBox(height: 25),

              Container(
                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(.12),

                  borderRadius: BorderRadius.circular(20),
                ),

                child: const Row(
                  children: [
                    Icon(Icons.handshake, color: Colors.green, size: 35),

                    SizedBox(width: 15),

                    Expanded(
                      child: Text(
                        "Flexible loans available to help riders own bikes.",

                        style: TextStyle(fontWeight: FontWeight.w600),
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

  Widget bikeCard(String name, String price, String payment) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(20),

        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.06), blurRadius: 12),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 28,

                backgroundColor: primaryColor.withOpacity(.15),

                child: const Icon(
                  Icons.motorcycle,
                  color: primaryColor,
                  size: 32,
                ),
              ),

              const SizedBox(width: 15),

              Text(
                name,

                style: const TextStyle(
                  fontSize: 18,

                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          Text(
            price,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          Text(payment, style: const TextStyle(color: Colors.grey)),

          const SizedBox(height: 15),

          SizedBox(
            width: double.infinity,

            child: ElevatedButton(
              onPressed: () {},

              child: const Text("Apply For Loan"),
            ),
          ),
        ],
      ),
    );
  }
}
