
import 'package:bryan_flutweb/widgets/resume.dart';
import 'package:flutter/material.dart';
import 'package:bryan_flutweb/about.dart';
import 'package:bryan_flutweb/projects.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'About'),
        '/projects': (context) => ProjectPage(title: 'Projects'),
        '/resume': (context) => const ResumePage(title: 'Resume'),
      },
      
    );
  }
}


