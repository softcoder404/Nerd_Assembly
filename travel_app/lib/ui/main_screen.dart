import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'notification_screen.dart';
import 'event_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  EventScreen eventScreen;
  NotificationScreen notificationScreen;
  ProfileScreen profileScreen;
  HomeScreen homeScreen;
  int currentTabIndex = 0;
  List<Widget> screens;
  Widget currentScreen;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeScreen = new HomeScreen();
    eventScreen = new EventScreen();
    profileScreen = new ProfileScreen();
    notificationScreen = new NotificationScreen();
    screens = [
      homeScreen,
      eventScreen,
      notificationScreen,
      profileScreen,
    ];
    currentScreen = homeScreen;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
            currentScreen = screens[index];
          });
        },
        currentIndex: currentTabIndex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.date_range,
            ),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
            ),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            title: Text(''),
          ),
        ],
      ),
      body: currentScreen,
    );
  }
}
