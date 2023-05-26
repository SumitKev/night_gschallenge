import 'package:flutter/material.dart';
import 'package:night_gschallenge/screens/home/home_body.dart';
import 'package:night_gschallenge/screens/library/library_screen.dart';
import 'package:night_gschallenge/screens/mysleep/my_sleep_screen.dart';
import 'package:night_gschallenge/screens/menu/menu_screen.dart';
import 'package:night_gschallenge/screens/plan/PlanScreen.dart';
import 'package:night_gschallenge/widgets/UI/top_row.dart';
import '../../navigators/bottomNavigator.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  final _pageList = [
    HomeBody(),
    MySleepScreen(),
    PlanScreen(),
    LibraryScreen(),
    MenuScreen()
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedPageIndex = 0;
  bool loading = true;

  void switchPageHandler(int selectedIndex){
    setState(() {
      selectedPageIndex = selectedIndex;
    });
  }

  void _bottomTabHandler(int selectedIndex) {
    if (selectedPageIndex == selectedIndex) {
      return;
    }
    setState(() {
      selectedPageIndex = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          BottomNavigator(_bottomTabHandler, selectedPageIndex),
      body: ListView(
        children: [
          TopRow(),
          GestureDetector(
            onHorizontalDragEnd: (details) {
              Velocity v = details.velocity;
              if(v.pixelsPerSecond.dx > v.pixelsPerSecond.dy){
                if(selectedPageIndex==0){

                }
                else{
                  switchPageHandler(selectedPageIndex - 1);
                }
              }
              else{
                if(selectedPageIndex==4){
 
                }
                else{
                  switchPageHandler(selectedPageIndex + 1);
                }
              }
            },
            child: widget._pageList[selectedPageIndex],
          )
        ],
      ),
    );
  }
}
