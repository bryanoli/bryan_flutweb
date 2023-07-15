
import 'package:flutter/material.dart';
import 'package:bryan_flutweb/widgets/menunav.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final Uri github = Uri.parse('https://github.com/bryanoli?tab=repositories');
  final Uri linkedin = Uri.parse('https://www.linkedin.com/in/bryanoli/');

  @override
  Widget build(BuildContext context) {
    

  Widget textIntro = Align(
  alignment: Alignment.topCenter,
  child: Center(
    child: SizedBox.square(
      
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 38,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        
        child: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText('Hello everyone!'),
            TypewriterAnimatedText('\nMy name is Bryan Olivares'),
          ],
          isRepeatingAnimation: false,
        ),
      ),
    ),
  ),
);



    Widget textAbout = const SizedBox.square(
      
        child: Padding(
        padding: EdgeInsets.all(32),
        child: Text('Computer Engineer with a focus on software development.'
        ' I started my engineering journey at Chabot College by learning all lower'
        ' division math, computer science, and physics classes.' 
        ' Then, continued in University of California Santa Barbara completing classes'
        ' that involve with working on software development with hardware, machine learning,' 
        ' and as well full-stack web programming. I created this website to showcase the projects'
        ' that worked on over the years.',
        style: TextStyle(
            fontSize: 38,
            fontWeight: FontWeight.bold,
          ), 
        softWrap: true,
        textAlign: TextAlign.justify,
        ),
      )

    ); 



    return Scaffold(
  appBar: AppBar(
    backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    title: Text(widget.title),
  ),
  drawer: NavDrawer(),
  body: Center(
    child: ListView(
      children: [
        Stack(
          children: [
            Positioned(
              child: Container(
                height: MediaQuery.of(context).size.height*.7,
                width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/images/skylinesf.jpg'),
              fit: BoxFit.fill,
            ),
            border: Border.all(color: const Color.fromARGB(255, 0, 0, 0), width: 2),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.9),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(10),
          ),
          
            ),

              

            Positioned(
              child: Container(
                height:MediaQuery.of(context).size.height/4,
                width: MediaQuery.of(context).size.width/2,
                decoration:  const BoxDecoration(
                    
                ),

                ),
              ),
            Positioned(
              top: 200,
              right: MediaQuery.of(context).size.width / 2 - 200,
              child: Container(
                // color:  Color.fromARGB(255, 255, 255, 255),
                height: 400,
                width: 400,
                decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/images/profile.jpg'),
                fit: BoxFit.fill,
              ),
              border: Border.all(color: const Color.fromARGB(255, 253, 253, 253), width: 7),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.9),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.all(10),
              ),
            ),
          Positioned(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // mainAxisSize: MainAxisSize.max,
                // crossAxisAlignment: CrossAxisAlignment.,
                
                children: <Widget>[
                 IconButton(
                  icon: const Icon(
                    SimpleIcons.github,
                    color:Color.fromARGB(255, 255, 0, 0),
                    size: 50
                  ),
                  onPressed: () {
                      launchUrl(github);
                 }
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(
                    SimpleIcons.linkedin,
                    color:Color.fromARGB(255, 255, 0, 0),
                    size: 50
                  ),
                  onPressed: () {
                      launchUrl(linkedin);
                 }
                ),
                
                ],
                
                ),

                ),

          ],
          
          ),
        textIntro,
        textAbout,
      ],
    ),
  ),
);
  }
}



