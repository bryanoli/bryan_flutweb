// import 'package:flutter/material.dart';
// import 'package:bryan_flutweb/home.dart';.

// class NavDrawer extends StatelessWidget {
//   final Function(String) scrollToSection;
//   NavDrawer({required this.scrollToSection});
//   ScrollController controller = ScrollController();

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           const DrawerHeader(
//             child: Text(
//               'Menu',
//               style: TextStyle(color: Colors.white, fontSize: 25),
//             ),
//           ),
//           _buildMult(Icons.input, 'Home', '/', context),
//           _buildMult(Icons.verified_user, 'Projects', '/projects', context),
//           _buildMult(Icons.lock_clock, 'TimeLine', '/timeline', context)
//         ],
//       ),
//     );
//   }
// }

// ListTile _buildMult(IconData icon, String title,ScrollController controller, BuildContext context){
//   return ListTile(
//     leading: Icon(icon),
//     title:Text(title),
//     onTap: (){
//       scrollToSection(title,controller); // Scroll to the corresponding section
//       Navigator.pop(context); // Close the drawer
//     },
//   );
// }


// void scrollToSection(String sectionTitle, ScrollController _scrollController, double sectionOffsets) {
//     double offset = sectionOffsets[sectionTitle]!;
//     _scrollController.animateTo(
//       offset,
//       duration: const Duration(milliseconds: 200),
//       curve: Curves.easeInOut,
//     );
//   }