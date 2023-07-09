import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
                color: Colors.black,
                // image: DecorationImage(
                //     fit: BoxFit.fill,
                //     image: AssetImage('assets/images/cover.jpg'))
                ),
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          _buildMult(Icons.input, 'Home', context),
          _buildMult(Icons.verified_user, 'Projects', context),
          // _buildMult(Icons.settings, 'Settings', context),
          // _buildMult(Icons.border_color, 'Feedback', context),
          // ListTile(
          //   leading: Icon(Icons.input),
          //   title: Text('Home'),
          //   onTap: () => {},
          // ),
          // ListTile(
          //   leading: Icon(Icons.verified_user),
          //   title: Text('Projects'),
          //   onTap: () => {Navigator.of(context).pop()},
          // ),
          // ListTile(
          //   leading: Icon(Icons.settings),
          //   title: Text('Settings'),
          //   onTap: () => {Navigator.of(context).pop()},
          // ),
          // ListTile(
          //   leading: Icon(Icons.border_color),
          //   title: Text('Feedback'),
          //   onTap: () => {Navigator.of(context).pop()},
          // ),
        ],
      ),
    );
  }
}

ListTile _buildMult(IconData icon, String title, BuildContext context){
  return ListTile(
    leading: Icon(icon),
    title:Text(title),
    onTap: () => {Navigator.of(context).pop()},
  );
}

//reference