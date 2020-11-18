import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yellow_class/screens/login.dart';
import 'package:yellow_class/utils/colors.dart';
import 'package:yellow_class/utils/constant.dart';
import 'package:yellow_class/utils/extension.dart';
import 'package:yellow_class/utils/strings.dart';
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
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 16, left: 16, right: 16),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        text(mCurrentUser.displayName ?? "Your Name",
                            textColor: yellow_class_textColorPrimary,
                            fontSize: textSizeNormal,
                            fontFamily: fontMedium),
                        text(mCurrentUser.email,
                            textColor: yellow_class_textColorPrimary,
                            fontSize: textSizeMedium,
                            fontFamily: fontMedium),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: <Widget>[
                            classAward(
                                "images/medal.png", yellow_class_colorPrimary),
                            classAward("images/crown.png", yellow_class_green),
                            classAward(
                                "images/cup.png", yellow_class_light_pink),
                            classAward(
                                "images/flag.png", yellow_class_orange_dark),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 30, left: 16),
                  child: text(yellow_class_lbl_general,
                      fontFamily: fontBold,
                      textAllCaps: true,
                      textColor: yellow_class_textColorPrimary)),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: boxDecoration(
                    bgColor: yellow_class_white, showShadow: true, radius: 0),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      child: classOption(
                        "images/heart.svg",
                        yellow_class_lbl_favourite_courses,
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: classOption(
                          "images/user.svg", yellow_class_lbl_my_friends),
                      onTap: () {},
                    ),
                    InkWell(
                      child: classOption("images/achievements.svg",
                          yellow_class_lbl_achievements),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 25, left: 16),
                  child: text(yellow_class_lbl_settings,
                      fontFamily: fontBold,
                      textAllCaps: true,
                      textColor: yellow_class_textColorPrimary)),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: boxDecoration(
                    bgColor: yellow_class_white, showShadow: true, radius: 0),
                child: Column(
                  children: <Widget>[
                    classOption(
                        "images/key.svg", yellow_class_lbl_edit_login_details),
                    classOption("images/correct.svg",
                        yellow_class_lbl_update_interests),
                    classOption(
                        "images/block.svg", yellow_class_lbl_blocked_users),
                    SizedBox(height: 16),
                    text("Made by 17BCE2189",
                        textColor: yellow_class_textColorPrimary,
                        fontSize: textSizeMedium,
                        fontFamily: fontMedium),
                    SizedBox(height: 8),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: view(),
              ),
              YellowClassButton(
                textContent: "Sign Out",
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => YellowClassLogin()));
                },
              ),
            ],
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
                  SizedBox(height: 16),
                  text("Made by 17BCE2189",
                      textColor: yellow_class_textColorPrimary,
                      fontSize: textSizeMedium,
                      fontFamily: fontMedium),
                  SizedBox(height: 8),
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
                    child: Column(
                      children: <Widget>[profileImg, profileContent],
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
