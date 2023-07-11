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

  final Uri uri = Uri.parse('https://about.datadrivenucsb.com/');

  @override
  Widget build(BuildContext context) {
    
    

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: NavDrawer(),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: 500,
            child: InkWell(
                child:Image.asset(
                    'assets/images/logo.jpg',
                    fit: BoxFit.fill,
              ),
               
              onTap: (){
                launchUrl(uri);
              },
              
            ),
            ),
            // Other widgets go here
          ],
        ),
      ),
    );
  }
}