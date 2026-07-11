import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String userName;

  const ProfileCard({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.12),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),

      child: Row(
        children: [
          CircleAvatar(
            radius: 38,
            backgroundColor: Colors.blue.shade100,
            child: const Icon(Icons.person, size: 42, color: Colors.blue),
          ),

          const SizedBox(width: 18),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                const Text(
                  "Professional Rider",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    const Icon(Icons.verified, color: Colors.green, size: 18),

                    const SizedBox(width: 5),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: const Text(
                        "Verified Account",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
