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
                image: DecorationImage(
                    fit: BoxFit.scaleDown,
                    image: AssetImage('assets/images/profile.jpg'))
                ),
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          _buildMult(Icons.input, 'Home', '/', context),
          _buildMult(Icons.verified_user, 'Projects', '/projects', context),
          _buildMult(Icons.lock_clock, 'TimeLine', '/timeline', context)
        ],
      ),
    );
  }
}

ListTile _buildMult(IconData icon, String title, String routeName, BuildContext context){
  return ListTile(
    leading: Icon(icon),
    title:Text(title),
    onTap: () => {Navigator.pushNamed(context, routeName),
    },
  );
}
