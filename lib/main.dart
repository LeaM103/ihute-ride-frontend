import 'package:flutter/material.dart';
import 'screens/sign_in_screen.dart';

void main() {
  runApp(const IhuteRideApp());
}

class IhuteRideApp extends StatelessWidget {
  const IhuteRideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ihute Ride',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: const SignInScreen(),
    );
  }
}
