import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  static const String routeName = '/';
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('login'),
      ),
    );
  }
}
