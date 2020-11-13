import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yellow_class/screens/signup.dart';
import 'package:yellow_class/utils/colors.dart';
import 'package:yellow_class/utils/extension.dart';
import 'package:yellow_class/utils/images.dart';
import 'package:yellow_class/utils/strings.dart';
import 'package:yellow_class/utils/widget.dart';

class YellowClassLogin extends StatefulWidget {
  static String tag = '/YellowClassModrenMedicine';

  @override
  _YellowClassLoginState createState() => _YellowClassLoginState();
}

class _YellowClassLoginState extends State<YellowClassLogin> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(yellow_class_layout_background);
    var width = MediaQuery.of(context).size.width;
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
                          backgroundImage: AssetImage("profile.png"),
                          radius: width / 7),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    YellowClassEditTextStyle(yellow_class_hint_email,
                        isPassword: false),
                    SizedBox(
                      height: 16,
                    ),
                    YellowClassEditTextStyle(yellow_class_hint_password,
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
                          onPressed: () {},
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
