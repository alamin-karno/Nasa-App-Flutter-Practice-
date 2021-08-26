import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/screens/bottomNavScreens/homeNavView.dart';

import 'bottomNavScreens/marsRoverView.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int currentIndex = 0;
  List listOfBottomNavItem = [
    HomeNavView(),
    MarsRoverView(),
    Container(
      color: Colors.redAccent,
    ),
    Container(
      color: Colors.greenAccent,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listOfBottomNavItem[currentIndex],
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Colors.grey[900],
        animationDuration: Duration(milliseconds: 300),
        selectedIndex: currentIndex,
        onItemSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            activeColor: Colors.white,
            inactiveColor: Colors.grey,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.explore_rounded),
            title: Text('Mars'),
            activeColor: Colors.white,
            inactiveColor: Colors.grey,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.bookmark_rounded),
            title: Text('Saved'),
            activeColor: Colors.white,
            inactiveColor: Colors.grey,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.account_box_outlined),
            title: Text('About'),
            activeColor: Colors.white,
            inactiveColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
