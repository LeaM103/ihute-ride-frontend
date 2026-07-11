import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obscurePassword = true;
  bool isLoading = false;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> registerUser() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse("http://192.168.1.7:5000/api/auth/register"),

        headers: {"Content-Type": "application/json"},

        body: jsonEncode({
          "name": nameController.text.trim(),

          "email": emailController.text.trim(),

          "password": passwordController.text.trim(),
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(data["message"])));

        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(data["message"])));
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Connection error: $e")));
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,

      body: Center(
        child: Container(
          width: 390,

          height: 850,

          color: const Color(0xFFF5F7FB),

          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),

              child: Column(
                children: [
                  const SizedBox(height: 30),

                  // Logo
                  Image.asset(
                    "assets/ihute_logo.png",

                    height: 85,

                    errorBuilder: (context, error, stackTrace) {
                      return const CircleAvatar(
                        radius: 42,

                        backgroundColor: Colors.blue,

                        child: Icon(
                          Icons.motorcycle,

                          size: 45,

                          color: Colors.white,
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    "Create Account",

                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    "Join Ihute Ride today",

                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),

                  const SizedBox(height: 30),

                  TextField(
                    controller: nameController,

                    decoration: InputDecoration(
                      labelText: "Full Name",

                      prefixIcon: const Icon(Icons.person_outline),

                      filled: true,

                      fillColor: Colors.white,

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  TextField(
                    controller: emailController,

                    decoration: InputDecoration(
                      labelText: "Email",

                      prefixIcon: const Icon(Icons.email_outlined),

                      filled: true,

                      fillColor: Colors.white,

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  TextField(
                    controller: phoneController,

                    decoration: InputDecoration(
                      labelText: "Phone Number",

                      prefixIcon: const Icon(Icons.phone_outlined),

                      filled: true,

                      fillColor: Colors.white,

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  TextField(
                    controller: passwordController,

                    obscureText: obscurePassword,

                    decoration: InputDecoration(
                      labelText: "Password",

                      prefixIcon: const Icon(Icons.lock_outline),

                      suffixIcon: IconButton(
                        icon: Icon(
                          obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),

                        onPressed: () {
                          // after successful registration response

                          nameController.clear();
                          emailController.clear();
                          phoneController.clear();
                          passwordController.clear();

                          setState(() {
                            obscurePassword = !obscurePassword;
                          });
                        },
                      ),

                      filled: true,

                      fillColor: Colors.white,

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  SizedBox(
                    width: double.infinity,

                    height: 55,

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),

                      onPressed: isLoading ? null : registerUser,

                      child: isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                              "Create Account",

                              style: TextStyle(
                                color: Colors.white,

                                fontSize: 18,
                              ),
                            ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },

                    child: const Text(
                      "Already have an account? Sign In",

                      style: TextStyle(fontWeight: FontWeight.bold),
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
}
