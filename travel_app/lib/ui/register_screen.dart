import 'package:flutter/material.dart';
import 'main_screen.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _passwordVisibility = true;
  bool _rememberedMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Register',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter your fullname',
                          labelText: 'Name',
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onSaved: (value) {},
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onSaved: (value) {},
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        obscureText: _passwordVisibility,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.vpn_key),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _passwordVisibility = !_passwordVisibility;
                              });
                            },
                            child: Icon(Icons.remove_red_eye,
                                color: _passwordVisibility
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onSaved: (value) {},
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        obscureText: _passwordVisibility,
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          labelText: 'Confirm Password',
                          prefixIcon: Icon(Icons.vpn_key),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _passwordVisibility = !_passwordVisibility;
                              });
                            },
                            child: Icon(Icons.remove_red_eye,
                                color: _passwordVisibility
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onSaved: (value) {},
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                Checkbox(
                                    value: _rememberedMe,
                                    onChanged: (bool val) {
                                      setState(() {
                                        _rememberedMe = val;
                                      });
                                    }),
                                Text(
                                  'Remember me',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      margin: EdgeInsets.only(top: 10, bottom: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Theme.of(context).buttonColor,
                      ),
                      width: double.infinity,
                      child: FlatButton(
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => MainScreen())),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        'Or connect with',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.deepPurple.withOpacity(0.8)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 40,
                            width: 40,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.grey, width: 1.0),
                            ),
                            child: Image(
                              image: AssetImage('assets/images/facebook.png'),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.grey, width: 1.0),
                            ),
                            child: Image(
                              image: AssetImage('assets/images/googlePlus.png'),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.grey, width: 1.0),
                            ),
                            child: Image(
                              image: AssetImage('assets/images/twiiter.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, top: 10),
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => LoginScreen())),
                        child: RichText(
                          text: TextSpan(
                              text: 'Have an account?    ',
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.black),
                              children: [
                                TextSpan(
                                    text: 'Login',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Theme.of(context).primaryColor)),
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
