import 'package:flutter/material.dart';
import 'package:ghost_story_tools_v3/routes/routes.dart';
// import 'package:../routes/routes.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: 
      ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
              text: 'Home',
              icon: Icons.home,
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.boards)),
          _createDrawerItem(
              text: 'Points',
              // icon: Icons.swap_vert,
              icon: Icons.functions,
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.points)),
          _createDrawerItem(
              text: 'Highscore',
              icon: Icons.swap_vert,
              // icon: Icons.functions,
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.highscore)),
          Divider(),
        ],
      ),
    );
  }

  Widget _createHeader() {
    return Container(
        height: 83.0,
        color: Colors.blueAccent,
        child: DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
                ),
            child: Stack(children: <Widget>[
              Positioned(
                  top: 2.0,
                  left: 18.0,
                  child: 
                    Text("Ghost Story Tools",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28.0,
                          fontWeight: FontWeight.w500))),
            ])));
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
         Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text,style: TextStyle(fontSize: 20),),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
