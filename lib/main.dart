import 'package:flutter/material.dart';

import 'SignUp_SignIn/splash_screen.dart';

void main() {
  runApp(const Fellow4UApp());
}

class Fellow4UApp extends StatelessWidget {
  const Fellow4UApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fellow4U',
      theme: ThemeData(useMaterial3: true),
      home: const SplashScreen(),
    );
  }
}
