import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http_error_handling_1/screens/home/home_screen.dart';
import 'package:http_error_handling_1/screens/other/other_screen.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  var _pages = [
    HomeScreen(),
    OtherScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.calendar_badge_minus), label: 'other'),
        ],
      ),
    );
  }
}
