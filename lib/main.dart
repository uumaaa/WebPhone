import 'package:callinteligence/helpers/dependency_injection.dart';
import 'package:callinteligence/pages/controller_page.dart';
import 'package:callinteligence/pages/login_page.dart';
import 'package:callinteligence/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  DependencyInjection.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        Provider.of<ThemeProvider>(context, listen: true);
        return MaterialApp(
          title: 'CallIntelligence',
          debugShowCheckedModeBanner: false,
          home: LoginPage(),
          routes: {
            ControllerPage.routeName: (context) => const ControllerPage()
          },
        );
      },
    );
  }
}
