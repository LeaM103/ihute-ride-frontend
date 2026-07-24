import 'package:flutter/material.dart';

import 'bike_screen.dart';
import 'home_screen.dart';
import 'insurance_screen.dart';
import 'profile_screen.dart';
import 'savings_screen.dart';

class MainNavigation extends StatefulWidget {
  final String userId;
  final String userName;

  const MainNavigation({
    super.key,
    required this.userId,
    required this.userName,
  });

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeScreen(userName: widget.userName),

      const SavingsScreen(),

      const BikeScreen(),

      const InsuranceScreen(),

      ProfileScreen(
        userId: widget.userId.toString(),
        userName: widget.userName,
      ),
    ];

    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        type: BottomNavigationBarType.fixed,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),

          BottomNavigationBarItem(icon: Icon(Icons.savings), label: "Savings"),

          BottomNavigationBarItem(icon: Icon(Icons.motorcycle), label: "Bike"),

          BottomNavigationBarItem(
            icon: Icon(Icons.security),
            label: "Insurance",
          ),

          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
