
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
    
   Widget textIntro = SizedBox(
      width: 250,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 38,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        
      
      child: AnimatedTextKit(
        // repeatForever: false,
        animatedTexts: [
        TypewriterAnimatedText('Hello everyone!'),
        TypewriterAnimatedText('\n My name is Bryan Olivares'),
        ],
        isRepeatingAnimation: false,
        
        ),
      ),
    );

    Widget textAbout = const SizedBox.square(
      
        child: Padding(
        padding: EdgeInsets.all(32),
        child: Text('Computer Engineer with a focus on software development.'
        ' I started my engineering journey in Chabot College by learning all lower'
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
          textIntro,
          Image.asset('assets/images/profile.jpg',
          width:500,
          height: 500,
          fit: BoxFit.contain,
            ),
            textAbout
          ],
        ),
      ),
    );
  }
}



