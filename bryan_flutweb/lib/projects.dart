import 'package:bryan_flutweb/widgets/summary.dart';
import 'package:flutter/material.dart';
import 'package:bryan_flutweb/widgets/menunav.dart';
import 'package:url_launcher/url_launcher.dart';



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

class ProjectPage extends StatelessWidget {
  ProjectPage({super.key, required this.title});

  final String title;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      drawer: NavDrawer(),
      body: Center(
        child: ListView.builder(
          itemCount: projects.length,
          itemBuilder: (BuildContext context, int index) {
            final project = projects[index];
            return _projectTemplate(project, context);
          },
        ),
      ),
    );
  }

  Widget _projectTemplate(ProjectData project, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Text(
              project.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.yellowAccent, width: 2),
                borderRadius: BorderRadius.circular(20)
              ),
              child: InkWell(
                onTap: () {
                  _showPopUp(context, project);
                },
                child: Image.asset(
                  project.image,
                  width: MediaQuery.of(context).size.width * 0.6, // Adjust this value to control image width
                  height: MediaQuery.of(context).size.height * 0.6, // Adjust this value to control image height
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

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

}

