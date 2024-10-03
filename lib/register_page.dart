import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'app_bar.dart';
import 'package:final_grocery_app/Services/auth_services.dart';// Import the AuthServices for authentication
import 'rounded_button.dart';
import 'home_screen.dart';
import 'package:final_grocery_app/sign_in_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _email = '';
  String _password = '';
  String _confirmpassword = '';
  String _name = '';

  createAccountPressed() async {
    bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_email);

    if (!emailValid) {
      errorSnackBar(context, 'Email not valid');
      return;
    }

    if (_password != _confirmpassword) {
      errorSnackBar(context, 'Passwords do not match');
      return;
    }

    http.Response response = await AuthServices.register(_name, _email, _password);
    Map responseMap = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print('Login Successfull');
      Navigator.pushReplacementNamed(context, '/products');
    } else {
      errorSnackBar(context, responseMap.values.first[0]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Register', showBackButton: true),
      backgroundColor: const Color(0xFFFFD700), // Gold background
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Create Your Account',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(labelText: 'Name'),
              onChanged: (value) {
                setState(() {
                  _name = value;
                });
              },
            ),
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
            TextField(
              decoration: const InputDecoration(labelText: 'Confirm Password'),
              obscureText: true,
              onChanged: (value) {
                setState(() {
                  _confirmpassword = value;
                });
              },
            ),
            const SizedBox(height: 20),
            RoundedButton(
              btnText: 'Sign Up',
              onBtnPressed: () => createAccountPressed(),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => SignInPage(),
                    ));
              },
              child: const Text(
                'Already have an account? Log in',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void errorSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
