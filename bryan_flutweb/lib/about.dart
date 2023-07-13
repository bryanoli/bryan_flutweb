
import 'package:flutter/material.dart';
import 'package:bryan_flutweb/widgets/menunav.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


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
        // textAlign: TextAlign.justify,
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
        Container(
          height: 700,
          width: 500,
          // alignment: Alignment.center,
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
          child: Container(
            height: 400,
            width: 400,
            margin: EdgeInsets.all(1),
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
             boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.9),
                blurRadius: 0.1,
                offset: const Offset(0, 1),
              ),
            ],
            image: const DecorationImage(
              image: AssetImage('assets/images/profile.jpg'),
                fit: BoxFit.contain ,
              
                ),
            //    border: Border.all(color: const Color.fromARGB(255, 0, 0, 0), width: 2),
            // borderRadius: BorderRadius.circular(10),
           
             ),
          ),
          
          
            
          ),
        textIntro,
        textAbout,
      ],
    ),
  ),
);
  }
}



