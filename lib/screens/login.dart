import 'package:flutter/material.dart';
import 'package:yellow_class/main.dart';
import 'package:yellow_class/screens/signup.dart';
import 'package:yellow_class/utils/colors.dart';
import 'package:yellow_class/utils/dialog_card.dart';
import 'package:yellow_class/utils/extension.dart';
import 'package:yellow_class/utils/strings.dart';
import 'package:yellow_class/utils/widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YellowClassLogin extends StatefulWidget {
  @override
  _YellowClassLoginState createState() => _YellowClassLoginState();
}

class _YellowClassLoginState extends State<YellowClassLogin> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(yellow_class_layout_background);
    var width = MediaQuery.of(context).size.width;
    TextEditingController emailController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();
    return Scaffold(
      backgroundColor: yellow_class_layout_background,
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Container(
              padding: EdgeInsets.only(left: 8),
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: yellow_class_colorPrimary,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 40, right: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: yellow_class_white, width: 4)),
                      child: CircleAvatar(
                          backgroundImage: AssetImage("images/profile.png"),
                          radius: width / 7),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    YellowClassEditTextStyle(
                        yellow_class_hint_email, emailController,
                        isPassword: false),
                    SizedBox(
                      height: 16,
                    ),
                    YellowClassEditTextStyle(
                        yellow_class_hint_password, passwordController,
                        isPassword: true),
                    SizedBox(
                      height: 50,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 120,
                        alignment: Alignment.center,
                        child: YellowClassButton(
                          onPressed: () async {
                            try {
                              User user = (await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text,
                              ))
                                  .user;
                              if (user != null) {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setString(
                                    'displayName', user.displayName);
                                Future.delayed(
                                  const Duration(milliseconds: 500),
                                  () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          CustomDialog(
                                              true, "Successfully logged in"),
                                    );
                                  },
                                );

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MyHomePage(title: 'Yellow Class')));
                              }
                            } catch (e) {
                              Future.delayed(
                                const Duration(milliseconds: 1000),
                                () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        CustomDialog(false, "Couldn't login"),
                                  );
                                },
                              );
                              print(e);
                              emailController.text = "";
                              passwordController.text = "";
                            }
                          },
                          textContent: yellow_class_lbl_enter,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                margin: EdgeInsets.only(bottom: 30),
                width: MediaQuery.of(context).size.width,
                child: GestureDetector(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      text(yellow_class_lbl_don_t_joined_yet),
                      SizedBox(
                        width: 8,
                      ),
                      text(
                        yellow_class_lbl_join,
                        textColor: yellow_class_colorPrimary,
                      )
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => YellowClassSignUp()),
                    );
                  },
                )),
          )
        ],
      ),
    );
  }
}
