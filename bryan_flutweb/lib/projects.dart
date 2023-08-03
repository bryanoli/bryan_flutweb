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
    
    Widget drivenSummary = SizedBox(
        height: MediaQuery.of(context).size.height/2,
        width: MediaQuery.of(context).size.width/4,
        child: const Padding(
        padding: EdgeInsets.all(32),
        child: Text('Achieved second place in a competitive capstone project, working collaboratively with a team to'
        ' design, develop, and present innovative solutions. For more infomation click on the button on the bottom.',
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ), 
        softWrap: true,
        // textAlign: TextAlign.justify,
        ),
      )

    ); 

    Widget gauchoSummary = SizedBox(
        height: MediaQuery.of(context).size.height/2,
        width: MediaQuery.of(context).size.width/4,
        child: const Padding(
        padding: EdgeInsets.all(32),
        child: Text('Contribute to GauchoRide, an application to assist students facing difficulties attending classes.'
        ' The application serves as a platform for planning and organizing rides and pickups. For more infomation click on the button on the bottom.',
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ), 
        softWrap: true,
        // textAlign: TextAlign.justify,
        ),
      )

    ); 
    

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: NavDrawer(),
      body: ListView(
        children: [
            _projectTemplate('assets/images/datadriven.jpg', datadriven, "Data Driven", drivenSummary,context),
            _projectTemplate('assets/images/gauchoride.png', gauchoride, "GauchoRide", gauchoSummary,context),
            
            // Other widgets go here
          ],
        ),
      );
    
  }
}


//Template of creating containers containing the projects
Row _projectTemplate(String image, Uri uri , String title, Widget summary, BuildContext context) {

  return Row(
  mainAxisSize: MainAxisSize.min,
  // mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    // Expanded(
      // child: 
      SizedBox(
        height: 300,
        width: 500,
        child: InkWell(
          onTap: () {
            _showPopUp(context,title,summary,uri);
          },
          
          child: Image.asset(
            image,
            fit: BoxFit.contain,
          ),
        ),
      ),
    // ),
     const SizedBox(
      width: 20,
      ),
    // Column(
    //   mainAxisSize: MainAxisSize.min,
    //   children: [
    //     Text(title, style: const TextStyle(
    //     fontWeight: FontWeight.bold,
    //   ),
    //   ),
    //    Container(
    //   constraints: const BoxConstraints(
    //     maxHeight: 300,
    //     maxWidth: 500, // Adjust the width value as per your desired maximum width
    //   ),
    //   child: summary,
    // ),
    //   ],
    // ),
   
  ],
);

}


void _showPopUp(BuildContext context, String title, Widget summary, Uri uri) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: summary,
          actions: <Widget>[
           TextButton(onPressed:() { 
            launchUrl(uri);
            }, 
           child: Text (title)
           ),
           TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the pop-up
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
