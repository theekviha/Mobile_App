import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:final_grocery_app/Services/auth_services.dart'; // Ensure your AuthServices is correctly imported
import 'custom_app_bar.dart'; // Custom app bar for the new design
import 'home_screen.dart'; // Your product page or home screen

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String _email = '';
  String _password = '';

  // Function to handle login
  loginPressed() async {
    if (_email.isNotEmpty && _password.isNotEmpty) {
      http.Response response = await AuthServices.login(_email, _password);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Navigator.pushReplacementNamed(context, '/products');
      } else {
        errorSnackBar(context, responseMap.values.first);
      }
    } else {
      errorSnackBar(context, 'Please enter all required fields');
    }
  }

  // Function to display error snack bar
  void errorSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Sign In', showBackButton: true),
      backgroundColor: const Color(0xFFFFD700), // Gold background
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Hello, Welcome Back!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(labelText: 'Email'),
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              onChanged: (value) {
                setState(() {
                  _password = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => loginPressed(),
              child: const Text('Sign In'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Handle forgot password logic
              },
              child: const Text('Forgot Password?'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Handle Google login logic
                Navigator.pushReplacementNamed(context, '/products');
              },
              child: const Text('Sign in with Google'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle Facebook login logic
                Navigator.pushReplacementNamed(context, '/products');
              },
              child: const Text('Sign in with Facebook'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle Phone login logic
                Navigator.pushReplacementNamed(context, '/products');
              },
              child: const Text('Sign in with Phone Number'),
            ),
          ],
        ),
      ),
    );
  }
}
