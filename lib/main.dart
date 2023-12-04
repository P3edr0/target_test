import 'package:flutter/material.dart';
import 'package:target_test/presentation/ui/pages/home_page/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Target Test',
      theme: ThemeData(),
      home: const LoginPage(),
    );
  }
}
