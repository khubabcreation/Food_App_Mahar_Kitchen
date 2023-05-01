import 'package:flutter/material.dart';
import 'package:fooood/lib/Screeen/Cart%20Screen.dart';
import 'package:fooood/lib/Screeen/Post_Screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({this.email, Key? key}) : super(key: key);
  String? email;
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Drawer(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topRight: Radius.circular(4.0))),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFF6B5E55),
              Color(0xFF5D5047),
              Color(0xFF423731),
              Color(0xFF382D27),
              Color(0xFF302720),
            ], end: Alignment.bottomCenter, begin: Alignment.topCenter),
          ),
          child: Column(
            children: [
              DrawerHeader(
                child: Container(
                  width: width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xFF6B5E55),
                      Color(0xFF5D5047),
                      Color(0xFF423731),
                      Color(0xFF382D27),
                      Color(0xFF302720),
                    ], end: Alignment.bottomCenter, begin: Alignment.topCenter),
                  ),
                  child: Center(
                      child: Text(
                    widget.email.toString(),
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  )),
                ),
              ),
              //Header is End Here

              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostScreen(),
                      ));
                },
                leading: Icon(
                  Icons.workspaces,
                  color: Color(0xFFCAA21E),
                ),
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Home',
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartScreen(),
                      ));
                },
                leading: Icon(
                  Icons.shopping_cart,
                  color: Color(0xFFCAA21E),
                ),
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'My Cart',
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartScreen(),
                      ));
                },
                leading: Icon(
                  Icons.shopping_basket,
                  color: Color(0xFFCAA21E),
                ),
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'My Order',
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                  ),
                ),
              ),
              ListTile(
                onTap: () async {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  pref.remove('islogin');
                  Navigator.pop(context);
                },
                leading: Icon(
                  Icons.logout,
                  color: Color(0xFFCAA21E),
                ),
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Sign Out',
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
