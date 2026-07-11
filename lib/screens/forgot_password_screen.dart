import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();

  bool isLoading = false;

  Future<void> forgotPassword() async {
    print("FORGOT PASSWORD BUTTON CLICKED");

    setState(() {
      isLoading = true;
    });

    try {
      print("SENDING FORGOT PASSWORD REQUEST");

      final response = await http.post(
        Uri.parse("http://192.168.1.7:5000/api/auth/forgot-password"),

        headers: {"Content-Type": "application/json"},

        body: jsonEncode({"email": emailController.text.trim()}),
      );

      print("BACKEND RESPONSE:");
      print(response.body);
      print(response.statusCode);

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // Clear email after successful request
        emailController.clear();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data["message"] ?? "Request completed")),
        );
      } else {
        // Clear email even if request is denied
        emailController.clear();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data["message"] ?? "Something went wrong")),
        );
      }
    } catch (e) {
      print("FORGOT PASSWORD ERROR:");
      print(e);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Connection error: $e")));
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
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
                  const SizedBox(height: 40),

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

                  const SizedBox(height: 25),

                  const Text(
                    "Forgot Password?",

                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Enter your email to reset your password",

                    textAlign: TextAlign.center,

                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),

                  const SizedBox(height: 35),

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

                      onPressed: isLoading ? null : forgotPassword,

                      child: isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                              "Reset Password",

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
                      "Back to Sign In",

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
