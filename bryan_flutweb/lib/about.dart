
import 'package:flutter/material.dart';
import 'package:bryan_flutweb/widgets/menunav.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:bryan_flutweb/widgets/timelineEvents.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Uri> uriListSocials = [
  Uri.parse('https://github.com/bryanoli?tab=repositories'),
  Uri.parse('https://www.linkedin.com/in/bryanoli/'),
  ];

  List<Uri> uriListOrgs = [
  Uri.parse('https://www.ucsb.edu/'),
  Uri.parse('https://www.chabotcollege.edu/'),
  Uri.parse('https://www.karlstorz.com/'),
  ];


  Widget buildProfilePic(){
    return const CircleAvatar(
      radius: 100,
      backgroundImage: AssetImage('assets/images/profile.jpg'),
    );
  }

  Widget buildTextIntro() {
    return Column(
          children: [
            const Align(
              alignment: Alignment.topCenter,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(32),
                  child: Text(
                    "Bryan Olivares",
                    style: TextStyle(
                      fontSize: 35,
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
        );
  }

  Widget buildTextAbout(var height, var weight) {
    return const Column(
      children: [
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
    );
  }

  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context);
    var screenSize = device.size;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: NavDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center, // Align children at the top
              children: [
                Expanded(
                  child: buildTextIntro(),
                ),
                Expanded(
                  child: buildTextAbout(screenSize.height, screenSize.width),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: timeLineList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          // if (index > 0)
                            Visibility(
                              maintainState: true,
                              maintainAnimation: true,
                              maintainSize: true,
                              visible: index > 0,
                              child: Container(
                                height: 70,
                                width: 2,
                                color: index == 0? Colors.grey[900]:Colors.blue,
                              ),
                            ),
                          Container(
                            margin: const EdgeInsets.only(right: 5, left: 8),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.purple,
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
                                color: index == timeLineList.length -1 ? Colors.grey[900]:Colors.blue,
                              ),
                            ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          height: 140,
                          margin: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            border: Border(
                              right: BorderSide(
                                width: 3,
                                color: Colors.purple,
                              ),
                              bottom: BorderSide(
                                width: 3,
                                color: Colors.purple,
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(blurRadius: 3,
                              color: Colors.black26)
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(timeLineList[index].title,
                                  style: TextStyle(
                                    fontSize: 22, 
                                    fontWeight: FontWeight.bold,
                                  ),),
                                  Text(timeLineList[index].description,
                                  style: TextStyle(
                                    fontSize: 17, 
                                    fontWeight: FontWeight.normal,
                                ),),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            ),
          ]
        ),
      ),
    );
  }
}

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