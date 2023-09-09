import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:url_launcher/url_launcher.dart';



class TimeLineClass{
  final bool isFirst;
  final bool isPast;
  final bool isLast;
  final String title;
  final String description;
  final IconData icon;
  final String time;
  final String location;
  final Uri uri;
  TimeLineClass(this.isFirst,this.isPast,this.isLast,this.title,this.description,this.icon,this.time,this.location,this.uri);
}


List<TimeLineClass> timeLineList = [
  TimeLineClass(true,true,false,"DataDriven", "Capstone Engineering Project where my teammates and I learned how a product gets developed and the different stages it goes through such as planning, designing, developing, and revision",
  Icons.flutter_dash_sharp,"2022-2023", "Goleta, CA", Uri.parse('https://web.ece.ucsb.edu/~yoga/capstone/static/img/projects/slides/datadriven_pr.pdf')),
  TimeLineClass(false,true,false,"UC Santa Barbara", 
  "As a graduate of the Class of 2023, I took the time to discover my interest in the engineering field. This is where I stepped upon a Web Development class",
  Icons.school,"2020-2023", "Santa Barbara, CA", Uri.parse('https://www.ucsb.edu/')),
  TimeLineClass(false,true,false,"MatLab Learning Assistant", "Learning assistant for the students who were taking the class at Chabot College",
  Icons.computer,"2020-2020", "Hayward, CA", Uri.parse('https://www.chabotcollege.edu/')),
  TimeLineClass(false,true,true,"Chabot College", "Started my engineering journey in Chabot Community College",
  Icons.school,"2017-2020", "Hayward, CA", Uri.parse('https://www.chabotcollege.edu/')),
];

class TimeLineWidget extends StatefulWidget {
  const TimeLineWidget({super.key, required String title});

  @override
  State<TimeLineWidget> createState() => _TimeLineWidgetState();
}

class _TimeLineWidgetState extends State<TimeLineWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: timeLineList.length,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 300),
              child: TimelineTile(
                isFirst: timeLineList[index].isFirst,
                isLast: timeLineList[index].isLast,
                beforeLineStyle: LineStyle(color: Colors.red),
                indicatorStyle: IndicatorStyle(
                  width: 60,
                  color: Colors.purple,
                  iconStyle: IconStyle(
                    iconData: timeLineList[index].icon,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        }
      );
  }
}