import 'package:flutter/material.dart';
import '../model/proposal_model.dart';
import 'home_screen.dart';
import 'event_screen.dart';
import 'notification_screen.dart';
import 'profile_screen.dart';

class DirectionScreen extends StatefulWidget {
  final Proposal proposal;
  DirectionScreen({this.proposal});
  @override
  _DirectionScreenState createState() => _DirectionScreenState();
}

class _DirectionScreenState extends State<DirectionScreen> {
  HomeScreen homeScreen;
  EventScreen eventScreen;
  NotificationScreen notificationScreen;
  ProfileScreen profileScreen;
  int currentTabIndex = 0;
  List<Widget> screens;
  Widget currentScreen;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeScreen = HomeScreen();
    eventScreen = EventScreen();
    notificationScreen = NotificationScreen();
    profileScreen = ProfileScreen();
    screens = [
      homeScreen,
      eventScreen,
      notificationScreen,
      profileScreen,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: currentScreen ?? customBody(),
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
    );
  }

  Widget customBody() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          //Title text
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: Text(
              'Map',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
            ),
          ),
          //map container
          Expanded(
            child: Container(
              width: double.infinity,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/map.png'),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 10,
                    right: 10,
                    child: Container(
                      height: 110,
                      child: Card(
                        elevation: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: double.infinity,
                              width: 110,
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/tour.png'),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Text(
                                      'Unnamed Road',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      'Oja Oba, Ilorin Kwara State',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      '48.345323,40.234323',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
