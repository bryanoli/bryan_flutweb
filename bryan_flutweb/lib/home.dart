
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

class _MyHomePageState extends State<MyHomePage>{
  final ScrollController _scrollController = ScrollController();
  static const List<String> _sectionTitles = [
    "Home",
    'Projects',
    'TimeLine',
  ];
  bool mobile = false;


  @override
  Widget build(BuildContext context) {
    
    var device = MediaQuery.of(context);
    var screenSize = device.size;
    mobile = screenSize.width > 700 ? false : true;

    Map<String, double> sectionOffsets = {
      'Home': 0.0,
      'Projects': MediaQuery.of(context).size.height / 1.5,
      'TimeLine': MediaQuery.of(context).size.height * 2 / 1.5,
    };

    Map<String, double> sectionOffsetsMobile = {
      'Home': 0.0,
      'Projects': MediaQuery.of(context).size.height / 1,
      'TimeLine': MediaQuery.of(context).size.height * 2 / 1.5,
    };
    
    

return Scaffold(
  drawer: mobile ? Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        const DrawerHeader(
          child: Text('Menu',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        for (final sectionTitle in _sectionTitles)
          ListTile(
            title: Text(sectionTitle),
            onTap: () {
              // Scroll to the corresponding section
              _scrollController.animateTo(
                sectionOffsetsMobile[sectionTitle]!,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
              // Close the drawer
              Navigator.pop(context);
            },
          ),
      ],
    ),
  ): null,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            floating: false,
            pinned: true,
            snap: false,
            title: const Text('Home'),
            actions: mobile ? null : [
              for (final sectionTitle in _sectionTitles)
                ElevatedButton(
                  onPressed: ()=>{_scrollController.animateTo(
                    sectionOffsets[sectionTitle]!,
                    duration: const Duration(milliseconds: 200), 
                    curve: Curves.easeInOut
                  )},
                  child: Text(sectionTitle,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
          const SliverToBoxAdapter(
            child: AboutWidget(),
          ),
          const SliverToBoxAdapter(
            child: TitleWidget(title: 'Projects',),
          ),
          const SliverToBoxAdapter(
            child: ProjectPage(),
          ),
          const SliverToBoxAdapter(
            child: Divider(
              height: 20,
              thickness: 5,
              indent: 0,
              endIndent: 0,
              color: Colors.white,
            ),
          ),
          const SliverToBoxAdapter(
            child: TitleWidget(title: 'Timeline',),
          ),
          const TimeLineWidget(),
        ],
      ),
    );
  }
}
