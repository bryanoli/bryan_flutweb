import 'package:flutter/material.dart';
import 'package:bryan_flutweb/widgets/menunav.dart';



class ResumePage extends StatefulWidget {
  const ResumePage({super.key, required this.title});

  final String title;
  @override
  State<ResumePage> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {

  @override
  Widget build(BuildContext context) {
 
  return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: ListView(
          children:[
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
              'assets/images/Bryan_Olivares_Resume_1.jpg',
              fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );  
  }
}