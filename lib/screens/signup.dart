import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yellow_class/utils/colors.dart';
import 'package:yellow_class/utils/constant.dart';
import 'package:yellow_class/utils/extension.dart';
import 'package:yellow_class/utils/strings.dart';
import 'package:yellow_class/utils/widget.dart';

class YellowClassSignUp extends StatefulWidget {
  @override
  _YellowClassSignUpState createState() => _YellowClassSignUpState();
}

class _YellowClassSignUpState extends State<YellowClassSignUp> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(yellow_class_layout_background);
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: yellow_class_layout_background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SafeArea(
              child: Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: Icon(Icons.arrow_back,
                      color: yellow_class_colorPrimary, size: 30))),
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(left: 40, right: 40),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: yellow_class_white, width: 4)),
                        child: CircleAvatar(
                            backgroundImage: AssetImage("profile.png"),
                            radius: width / 8.5),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      YellowClassEditTextStyle(yellow_class_hint_full_name,
                          isPassword: false),
                      SizedBox(
                        height: 16,
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
                      Container(
                        width: 120,
                        alignment: Alignment.center,
                        child: YellowClassButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          textContent: yellow_class_lbl_join,
                        ),
                      ),
                      SizedBox(height: 20),
                      text(yellow_class_sign_up_info),
                      SizedBox(height: 4),
                      GestureDetector(
                        child: Text(
                          yellow_class_txt_terms_condition,
                          style: TextStyle(
                            fontSize: textSizeLargeMedium,
                            decoration: TextDecoration.underline,
                            color: yellow_class_colorPrimary,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
