import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio_app/screens/about_me_screen.dart';
import 'package:portfolio_app/screens/contact.dart';
import 'package:portfolio_app/screens/home_screen.dart';
import 'package:portfolio_app/screens/projects_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.black),
      initialRoute: '/',
      routes: {
        '/projects': (context) => const ProjectsScreen(),
        '/about me': (context) => const AboutMe(),
        '/contact': (context) => const Contact(),
      },
      home: const HomeScreen(),
    );
  }
}
