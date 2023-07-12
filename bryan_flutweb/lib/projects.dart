import 'package:flutter/material.dart';
import 'package:bryan_flutweb/widgets/menunav.dart';

import 'package:url_launcher/url_launcher.dart';


class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key, required this.title});

  

  final String title;

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {

  final Uri datadriven = Uri.parse('https://about.datadrivenucsb.com/');
  final Uri gauchoride = Uri.parse('https://github.com/ucsb-cs156-s23/proj-gauchoride-s23-5pm-3');

  @override
  Widget build(BuildContext context) {
    
    

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: NavDrawer(),
      body: Center(
        child: Row(
          children: [
            _projectTemplate('assets/images/logo.jpg', datadriven),
            _projectTemplate('assets/images/gauchoride.png', gauchoride)
            // Other widgets go here
          ],
        ),
      ),
    );
  }
}


//Template of creating containers containing the projects
SizedBox _projectTemplate(String image, Uri uri) {
  return SizedBox(
    height: 300,
    width: 500,
    child: InkWell(
      child:Image.asset(
        image,
        fit: BoxFit.fill,
        ),       
        onTap: (){
        launchUrl(uri);
       },
              
    ),
  );
}


