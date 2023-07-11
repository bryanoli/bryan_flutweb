import 'package:flutter/material.dart';
import 'package:bryan_flutweb/widgets/menunav.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key, required this.title});



  final String title;

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {


  @override
  Widget build(BuildContext context) {
    
    

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: NavDrawer(),
      body: Center(
        child: ListView(
          children: [
            
            // Other widgets go here
          ],
        ),
      ),
    );
  }
}