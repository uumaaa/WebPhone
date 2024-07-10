import 'package:callinteligence/helpers/dependency_injection.dart';
import 'package:callinteligence/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  DependencyInjection.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'CallIntelligence',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
