import 'package:intro_slider/intro_slider.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/slide_object.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<Slide> slides = new List();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slides.add(Slide(
      title: 'Plan Your Trips',
      description: 'Explore round the globe with our exclusive tour package',
      pathImage: 'assets/images/traveller.png',
      foregroundImageFit: BoxFit.fill,
      heightImage: 250,
      backgroundColor: Color(0xff5E47D8),
    ));
    slides.add(Slide(
      title: 'Find best deals',
      description: 'Explore round the globe with our exclusive tour package',
      pathImage: 'assets/images/adventure.png',
      foregroundImageFit: BoxFit.fill,
      heightImage: 250,
      backgroundColor: Color(0xff5E47D8),
    ));
    slides.add(Slide(
      title: 'Tour Desert',
      description: 'Explore round the globe with our exclusive tour package',
      pathImage: 'assets/images/tour.png',
      foregroundImageFit: BoxFit.fill,
      heightImage: 250,
      backgroundColor: Color(0xff5E47D8),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      colorActiveDot: Colors.white,
      slides: this.slides,
      onDonePress: () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen())),
    );
  }
}
