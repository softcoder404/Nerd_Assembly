import 'package:flutter/material.dart';
import 'package:travel_app/ui/splash_screen.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff5E47D8),
        buttonColor: Color(0xff5E47A8),
      ),
      title: 'Travel App',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
