import 'package:bryan_flutweb/widgets/resume.dart';
import 'package:flutter/material.dart';
import 'package:bryan_flutweb/widgets/menunav.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:bryan_flutweb/widgets/timelineEvents.dart';

class AboutWidget extends StatefulWidget {
  const AboutWidget({super.key});

  @override
  State<AboutWidget> createState() => _AboutWidgetState();
}

class _AboutWidgetState extends State<AboutWidget> {
  
  List<Uri> uriListSocials = [
  Uri.parse('https://github.com/bryanoli?tab=repositories'),
  Uri.parse('https://www.linkedin.com/in/bryanoli/'),
  ];

  
  Widget buildProfilePic(){
      return const CircleAvatar(
        radius: 100,
        backgroundImage: AssetImage('assets/images/profile.jpg'),
      );
  }

  Widget buildTextIntro() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Text(
                  "Bryan Olivares",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height:20,),
          buildProfilePic(),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: ()=> launchUrl(uriListSocials.first),
                hoverColor: Colors.red, 
                icon: const Icon(
                  SimpleIcons.github,
                  color: Colors.purple,
                  size: 50
                ),
              ),
              IconButton(
                onPressed: ()=> launchUrl(uriListSocials.elementAt(1)),
                hoverColor: Colors.red, 
                icon: const Icon(
                  SimpleIcons.linkedin,
                  color: Colors.purple,
                  size: 50
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          FloatingActionButton.extended(
            hoverColor: Colors.purple,
            onPressed:() => Navigator.pushNamed(context, '/resume'), 
            label: const Text('Resume'),
            backgroundColor: Colors.pink,
          ),
        ],
      ),
    );
  }

  Widget buildTextAbout(var height, var weight) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(30)
      ),
      child: const Column(
        children: [
          SizedBox(
            height: 30,
            child: Text('About',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.all(32),
              child: SelectionArea(
                child: Text(
                'Computer Engineer with a focus on software development.'
                ' I started my engineering journey at Chabot College by learning all lower'
                ' division math, computer science, and physics classes.'
                ' Then, continued at the University of California Santa Barbara, completing classes'
                ' that involve working on software development with hardware, machine learning,'
                ' and full-stack web programming.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
                // softWrap: true,
                textAlign: TextAlign.justify,
                ),
              ),
            ),
        ],
      ),
    );
  }

  bool mobile = false;

  @override
  Widget build(BuildContext context) {

    var device = MediaQuery.of(context);
    var screenSize = device.size;
    mobile = screenSize.width > 700 ? false : true;

    return SingleChildScrollView(
      child:Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: buildTextIntro(),
                ),
                Expanded(
                  child: buildTextAbout(screenSize.height, screenSize.width),
                ),
              ],
            ),
          ),
          const Divider(
            height: 20,
            thickness: 5,
            indent: 0,
            endIndent: 0,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}