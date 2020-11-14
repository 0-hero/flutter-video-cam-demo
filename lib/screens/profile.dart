import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yellow_class/screens/login.dart';
import 'package:yellow_class/utils/colors.dart';
import 'package:yellow_class/utils/constant.dart';
import 'package:yellow_class/utils/extension.dart';
import 'package:yellow_class/utils/widget.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Widget counter(String counter, String counterName) {
    return Column(
      children: <Widget>[
        profile(counter),
        text(counterName,
            textColor: yellow_class_textColorPrimary,
            fontSize: textSizeMedium,
            fontFamily: fontMedium)
      ],
    );
  }

  User mCurrentUser;
  FirebaseAuth _auth;
  bool loggedin = false;

  @override
  void initState() {
    super.initState();
    _auth = FirebaseAuth.instance;
    _getCurrentUser();
    print('Initialized user');
  }

  _getCurrentUser() async {
    mCurrentUser = await _auth.currentUser;
    print('Hello ' + mCurrentUser.displayName.toString());
    setState(() {
      mCurrentUser != null ? loggedin = true : false;
    });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(yellow_class_backgroundColor);
    final profileImg = new Container(
      margin: new EdgeInsets.symmetric(horizontal: 16.0),
      alignment: FractionalOffset.center,
      child: new CircleAvatar(
        backgroundImage: AssetImage("images/profile.png"),
        radius: 50,
      ),
    );
    final profileContent = loggedin
        ? new Container(
            margin: new EdgeInsets.only(top: 55.0),
            decoration: boxDecoration(radius: 10, showShadow: true),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 50),
                  text(mCurrentUser.displayName,
                      textColor: yellow_class_textColorPrimary,
                      fontSize: textSizeNormal,
                      fontFamily: fontMedium),
                  text(mCurrentUser.email,
                      textColor: yellow_class_textColorPrimary,
                      fontSize: textSizeMedium,
                      fontFamily: fontMedium),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: view(),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          )
        : new Container(
            margin: new EdgeInsets.only(top: 55.0),
            decoration: boxDecoration(radius: 10, showShadow: true),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 50),
                  YellowClassButton(
                    textContent: "Login",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => YellowClassLogin()));
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: view(),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          );
    return Scaffold(
      backgroundColor: yellow_class_backgroundColor,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 50, left: 2, right: 2),
            physics: ScrollPhysics(),
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(height: 16),
                  Container(
                    margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    child: Stack(
                      children: <Widget>[profileContent, profileImg],
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ),
          TopBar("Profile"),
        ],
      ),
    );
  }
}
