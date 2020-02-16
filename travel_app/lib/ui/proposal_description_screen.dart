import 'package:flutter/material.dart';
import '../model/proposal_model.dart';
import 'home_screen.dart';
import 'event_screen.dart';
import 'notification_screen.dart';
import 'profile_screen.dart';
import 'direction_screen.dart';

class ProposalDescriptionScreen extends StatefulWidget {
  final Proposal proposal;
  ProposalDescriptionScreen({this.proposal});
  @override
  _ProposalDescriptionScreenState createState() =>
      _ProposalDescriptionScreenState();
}

class _ProposalDescriptionScreenState extends State<ProposalDescriptionScreen> {
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
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //Title text
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              child: Text(
                'Offer details',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
              ),
            ),
            //map container
            Container(
              height: 250,
              width: double.infinity,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/map.png'),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 10,
                    right: 10,
                    child: Container(
                      height: 120,
                      child: Card(
                        elevation: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: double.infinity,
                              width: 100,
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
                            GestureDetector(
                              onTap: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => DirectionScreen(
                                            proposal: widget.proposal,
                                          ))),
                              child: Container(
                                width: 40,
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(right: 10, left: 5),
                                child: Icon(
                                  Icons.directions,
                                  color: Theme.of(context).primaryColor,
                                  size: 32,
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
            Container(
              margin: EdgeInsets.fromLTRB(20, 15, 20, 15),
              width: double.infinity,
              height: 360,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 20, 0, 0),
                      child: Text(
                        widget.proposal.title,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      widget.proposal.description,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.9),
                        letterSpacing: 1,
                        wordSpacing: 2,
                        height: 1.5,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            height: 110,
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Icon(
                                    Icons.access_time,
                                    color: Theme.of(context).primaryColor,
                                    size: 26,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 15.0),
                                  child: Text(
                                    widget.proposal.time,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            height: 110,
                            decoration: BoxDecoration(
                              color: Colors.lightBlueAccent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Icon(
                                    Icons.people,
                                    color: Theme.of(context).primaryColor,
                                    size: 26,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 15.0),
                                  child: Text(
                                    widget.proposal.people,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            height: 110,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Icon(
                                    Icons.language,
                                    color: Theme.of(context).primaryColor,
                                    size: 26,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 15.0),
                                  child: Text(
                                    widget.proposal.language,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Material(
                    color: Theme.of(context).primaryColor,
                    elevation: 10,
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 15),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white.withOpacity(0.7),
                                width: 0.5)),
                        child: FlatButton(
                          onPressed: () {},
                          child: Text(
                            'Send message',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
