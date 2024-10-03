import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen ({Key? key}) : super (key: key);
  @override
  Widget build(BuildContext_context) {
    return Scaffold(
      backgroundColor : Colors.blue,
      body: Center(
        child :Text ('Home Screen'),
      ),
    );
  }
}