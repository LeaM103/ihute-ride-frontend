import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'savings_screen.dart';
import 'bike_screen.dart';
import 'insurance_screen.dart';
import 'profile_screen.dart';

class MainNavigation extends StatefulWidget {
  final String userName;

  const MainNavigation({super.key, required this.userName});

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

      ProfileScreen(userName: widget.userName),
    ];

    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(.08), blurRadius: 20),
          ],
        ),

        child: NavigationBar(
          selectedIndex: currentIndex,

          onDestinationSelected: (index) {
            setState(() {
              currentIndex = index;
            });
          },

          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),

              selectedIcon: Icon(Icons.home),

              label: "Home",
            ),

            NavigationDestination(
              icon: Icon(Icons.savings_outlined),

              selectedIcon: Icon(Icons.savings),

              label: "Savings",
            ),

            NavigationDestination(
              icon: Icon(Icons.motorcycle_outlined),

              selectedIcon: Icon(Icons.motorcycle),

              label: "Bike",
            ),

            NavigationDestination(
              icon: Icon(Icons.security_outlined),

              selectedIcon: Icon(Icons.security),

              label: "Insurance",
            ),

            NavigationDestination(
              icon: Icon(Icons.person_outline),

              selectedIcon: Icon(Icons.person),

              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
