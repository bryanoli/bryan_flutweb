import 'package:bryan_flutweb/widgets/summary.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';



class ProjectData {
  final String image;
  final Uri uri;
  final String title;
  final Widget summary;

  ProjectData({
    required this.image,
    required this.uri,
    required this.title,
    required this.summary,
  });
}

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {

  final List<ProjectData> projects = [
    ProjectData(
      image: 'assets/images/datadriven.jpg',
      uri: Uri.parse('https://about.datadrivenucsb.com/'),
      title: 'Data Driven',
      summary: const SummaryWidget(
        text: 'Achieved second place in a competitive capstone project, working collaboratively with a team to'
            ' design, develop, and present innovative solutions. For more information click on the button on the bottom.',
      ),
    ),
    ProjectData(
      image: 'assets/images/gauchoride.png',
      uri: Uri.parse('https://github.com/ucsb-cs156-s23/proj-gauchoride-s23-5pm-3'),
      title: 'GauchoRide',
      summary: const SummaryWidget(
        text: 'Contribute to GauchoRide, an application to assist students facing difficulties attending classes.'
        ' The application serves as a platform for planning and organizing rides and pickups. For more infomation click on the button on the bottom.',
      ),
    ),
    ProjectData(
      image: 'assets/images/camerademo.png',
      uri: Uri.parse('https://github.com/bryanoli/Camera_Demo'),
      title: 'Camera Demo',
      summary: const SummaryWidget(
        text: 'Android Project playing with the camera that is integrated in the android phone.',
      ),
    ),
    ProjectData(
      image: 'assets/images/rsblogo.png',
      uri: Uri.parse('https://github.com/bryanoli/Ready_Set_Balance'),
      title: 'ReadySetBalance',
      summary: const SummaryWidget(
        text: 'Android Project that is a mobile fitness app. The features that it has are exercise videos, step counter, and BMI calculator',
      ),
    ),
    ProjectData(
      image: 'assets/images/soccerball.jpg',
      uri: Uri.parse('https://github.com/bryanoli/Fantasy_Futbol'),
      title: 'FantasyFutbol',
      summary: const SummaryWidget(
        text: 'Flutter Project creating a fantasy futbol website. It is still incomplete, but users can generate their own player cards based on'
        'league id and year of the season',
      ),
    ),
  ];

  void _showPopUp(BuildContext context, ProjectData project) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(project.title),
          content: project.summary,
          actions: <Widget>[
            TextButton(
              onPressed: () {
                launchUrl(project.uri);
              },
              child: Text(project.title),
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

  Widget _projectTemplate(ProjectData project, BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.yellowAccent, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          onTap: () {
            _showPopUp(context, project);
          },
          child: Image.asset(
            project.image,
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.6,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: projects.map((project) {
        return _projectTemplate(project, context);
      }).toList(),
      options: CarouselOptions(
        autoPlay: false,
        enlargeCenterPage: true,
        viewportFraction: 0.4,
        aspectRatio: 3.0,
        initialPage: 2,
      ),
    );
  }
}
