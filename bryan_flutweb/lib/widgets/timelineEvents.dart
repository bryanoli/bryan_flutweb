import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class TimeLineClass{
  final String title;
  final String description;
  final IconData icon;
  final String time;
  final String location;
  final Uri uri;
  TimeLineClass(this.title,this.description,this.icon,this.time,this.location,this.uri);
}


List<TimeLineClass> timeLineList = [
  TimeLineClass("DataDriven", 
  "Capstone Engineering Project where my teammates and" 
  " I learned how a product gets developed and the different stages" 
  " it goes through such as planning, designing, developing, and revision",
  Icons.flutter_dash_sharp,"2022-2023", "Goleta, CA", Uri.parse('https://web.ece.ucsb.edu/~yoga/capstone/static/img/projects/slides/datadriven_pr.pdf')),
  TimeLineClass("Karl Storz Imaging Inc: VDP Software Intern", 
  "Worked at Karl Storz Imaging Inc. During my time in the company, worked on debugging their front-end modules," 
  " learned on demoing examples of how the code work, as well learned basic CyberSecurity workflows.",
  Icons.work,"2020-2023", "Goleta, CA", Uri.parse('https://www.karlstorz.com/ca/en/usa-goleta-imaging.htm')),
  TimeLineClass("UC Santa Barbara", 
  "As a graduate of the Class of 2023, I took the time to discover my interest in the engineering field." 
  " Took many classes such as the fundamentals of electrical engineering, data structures, and computer network."
  " By my last year of college, I gain an interest of web development and decided to go for it.",
  Icons.school,"2020-2023", "Santa Barbara, CA", Uri.parse('https://www.ucsb.edu/')),
  TimeLineClass("Chabot College: MatLab Learning Assistant", 
  "Learning assistant for the students who were taking the class at Chabot College."
  " Tutoring this class improved my code analysing skills, as well practice being professional during working hours.",
  Icons.computer,"2020-2020", "Hayward, CA", Uri.parse('https://www.chabotcollege.edu/')),
  TimeLineClass("Chabot College", "Started my engineering journey in Chabot Community College. "
  "I was part of the Computer Science and Engineering club where students can help each other in their studies,"
  " as well participated in a robotics competition.",
  Icons.school,"2017-2020", "Hayward, CA", Uri.parse('https://www.chabotcollege.edu/')),
];



class TimeLineConnector extends StatelessWidget{
  final int index;

  const TimeLineConnector({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          maintainState: true,
          maintainAnimation: true,
          maintainSize: true,
          visible: index > 0,
          child: Container(
            height: 70,
            width: 2,
            color: index == 0 ? Colors.grey[900]:Colors.white,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 5, left: 8),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent,
            borderRadius: BorderRadius.circular(50),
          ),
          child: IconButton(
            onPressed: () => launchUrl(timeLineList[index].uri),
            icon: Icon(timeLineList[index].icon),
          ),
        ),
        Visibility(
          maintainState: true,
          maintainAnimation: true,
          maintainSize: true,
          visible: index != timeLineList.length -1,
          child: Container(
            height: 70,
            width: 2,
            color: index == timeLineList.length -1 ? Colors.grey[900]:Colors.white,
          ),
        ),
      ],
    );
  }
}

class TimeLineContainers extends StatelessWidget{
  final int index;

  const TimeLineContainers({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 140,
        margin: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.deepPurple,
          border: Border(
            right: BorderSide(
              width: 3,
              color: Colors.lightBlue,
            ),
            bottom: BorderSide(
              width: 3,
              color: Colors.lightBlue,
            ),
          ),
          boxShadow: [
            BoxShadow(blurRadius: 3,
            color: Colors.black26)
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(timeLineList[index].title,
                style: const TextStyle(
                  fontSize: 22, 
                  fontWeight: FontWeight.bold,
                ),),
                Text(timeLineList[index].description,
                style: const TextStyle(
                  fontSize: 17, 
                  fontWeight: FontWeight.normal,
              ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TimeLineWidget extends StatefulWidget {
  const TimeLineWidget({super.key,});

  @override
  State<TimeLineWidget> createState() => _TimeLineWidgetState();
}

 
class _TimeLineWidgetState extends State<TimeLineWidget> {
  
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: timeLineList.length,
        (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              children: [
                TimeLineConnector(index: index),
                TimeLineContainers(index: index,),
              ],
            ),
          );
        },
      ),
    );
  }
}