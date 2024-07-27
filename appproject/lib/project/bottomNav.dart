
import 'package:appproject/project/Registration.dart';
import 'package:appproject/project/about.dart';
import 'package:appproject/project/home_page.dart';
import 'package:appproject/project/viewProfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:light_bottom_navigation_bar/light_bottom_navigation_bar.dart';

void main(){
  runApp(MaterialApp(
    home: bottom_nav(),
    debugShowCheckedModeBanner: false,
  ));
}
class bottom_nav extends StatefulWidget{
  @override
  State<bottom_nav> createState() => _bottom_navState();
}
class _bottom_navState extends State<bottom_nav> {
  Color primaryColor = Colors.red;
  int index =0;
  var Screens=[
    HomePage(),
    profile(),
    AboutUs()
    //Registration(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: LightBottomNavigationBar(
        currentIndex: index,
        items: [
          LightBottomNavigationBarItem(
            selectedIcon: Icons.home,
            unSelectedIcon: Icons.home_outlined,
            unSelectedIconColor: Colors.white,
            splashColor: primaryColor,
            backgroundShadowColor: primaryColor,
            borderBottomColor: primaryColor,
            selectedIconColor: primaryColor,
          ),
          LightBottomNavigationBarItem(
            selectedIcon: Icons.person,
            unSelectedIcon: Icons.person_outline,
            unSelectedIconColor: Colors.white,
            splashColor: primaryColor,
            backgroundShadowColor: primaryColor,
            borderBottomColor: primaryColor,
            selectedIconColor: primaryColor,
          ),
          LightBottomNavigationBarItem(
            selectedIcon: Icons.info,
            unSelectedIcon: Icons.info_outline,
            unSelectedIconColor: Colors.white,
            splashColor: primaryColor,
            backgroundShadowColor: primaryColor,
            borderBottomColor: primaryColor,
            selectedIconColor: primaryColor,
          ),
        ],
        onSelected: (index) {
          setState(() {
            this.index=index;
          });
          // print('tab $index');
        },

      ),
      body: Screens[index],
    );
  }
}