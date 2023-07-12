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
  final String drivenSum =  "Summary";
  final String rideSum =  "Summary";


  @override
  Widget build(BuildContext context) {
    
    

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: NavDrawer(),
      body: ListView(
        children: [
            _projectTemplate('assets/images/datadriven.jpg', datadriven, "Data Driven", drivenSum),
            _projectTemplate('assets/images/gauchoride.png', gauchoride, "GauchoRide", rideSum),
            // Other widgets go here
          ],
        ),
      );
    
  }
}


//Template of creating containers containing the projects
Row _projectTemplate(String image, Uri uri , String title, String summary) {

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
          child: Image.asset(
            image,
            fit: BoxFit.contain,
          ),
          onTap: () {
            launchUrl(uri);
          },
        ),
      ),
    // ),
     const SizedBox(
      width: 20,),
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title),
        Text(summary),
      ],
    ),
   
  ],
);
  
  // return Row(
  //   mainAxisSize: MainAxisSize.min,
  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //   children: [
  //     SizedBox(
  //     height: 300,
  //     width: 500,
  //     child: InkWell(
  //       child:Image.asset(
  //       image,
  //       fit: BoxFit.fill,
  //       ),       
  //       onTap: (){
  //       launchUrl(uri);
  //      },
              
  //      ),
  //     )
      
  //   ],
    
    
  // );
 }


