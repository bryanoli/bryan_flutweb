
import 'package:bryan_flutweb/widgets/aboutwidget.dart';
import 'package:bryan_flutweb/widgets/titlewidget.dart';
import 'package:flutter/material.dart';
import 'package:bryan_flutweb/widgets/menunav.dart';
import 'package:bryan_flutweb/projects.dart';
import 'package:bryan_flutweb/widgets/timelineEvents.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Widget>navItems = [
    ElevatedButton(
      onPressed: ()=>{}, 
      child: const Text("Projects",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),
      ),
    ),
    ElevatedButton(
      onPressed: ()=>{
      }, 
      child: const Text("Timeline",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),
      ),
    ),
  ];

  
  bool mobile = false;
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    var device = MediaQuery.of(context);
    var screenSize = device.size;
    mobile = screenSize.width > 700 ? false : true;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions:mobile ? null: navItems,
      ),
      drawer: mobile ? NavDrawer() : null,
      body: PageView(
        controller: controller,
          children:const [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: AboutWidget(),
                ),
                SliverToBoxAdapter(
                  child: TitleWidget(title: 'Projects',),
                ),
                SliverToBoxAdapter(
                  child: ProjectPage(),
                ),
                SliverToBoxAdapter(
                  child: Divider(
                    height: 20,
                    thickness: 5,
                    indent: 0,
                    endIndent: 0,
                    color: Colors.white,
                  ),
                ),
                SliverToBoxAdapter(
                  child: TitleWidget(title: 'Timeline',),
                ),
                TimeLineWidget(),
              ],
            ), 
        ],
      ),
    );
  }
}
