import 'package:flutter/material.dart';
import 'package:yellow_class/models/models.dart';
import 'package:yellow_class/utils/colors.dart';
import 'package:yellow_class/utils/constant.dart';
import 'package:yellow_class/utils/extension.dart';
import 'package:yellow_class/utils/strings.dart';
import 'package:yellow_class/utils/widget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(yellow_class_layout_background);
    return Scaffold(
      backgroundColor: yellow_class_layout_background,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 50, left: 2, right: 2),
            physics: ScrollPhysics(),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    child: text("Your Courses",
                        fontFamily: fontBold,
                        fontSize: textSizeLargeMedium,
                        textColor: yellow_class_textColorPrimary),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
          TopBar("Home"),
        ],
      ),
    );
  }
}
