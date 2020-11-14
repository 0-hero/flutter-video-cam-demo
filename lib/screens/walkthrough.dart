import 'package:yellow_class/main.dart';
import 'package:yellow_class/utils/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:yellow_class/screens/login.dart';
import 'package:yellow_class/models/models.dart';
import 'package:yellow_class/utils/colors.dart';
import 'package:yellow_class/utils/extension.dart';
import 'package:yellow_class/utils/strings.dart';
import 'package:yellow_class/utils/widget.dart';
import 'package:yellow_class/utils/constant.dart';

class YellowClassWalkThrough extends StatefulWidget {
  @override
  _YellowClassWalkThroughState createState() => _YellowClassWalkThroughState();
}

class _YellowClassWalkThroughState extends State<YellowClassWalkThrough> {
  int currentIndexPage = 0;
  int pageLength;
  var titles = ['Welcome', 'Select Course', 'Learn Topics'];
  var subTitles = [
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.This is simply text ",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.This is simply text  ",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.This is simply text"
  ];

  List<YellowClassWalk> mList1;

  @override
  void initState() {
    super.initState();
    mList1 = walkImg();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(yellow_class_layout_background);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            color: yellow_class_layout_background,
            child: PageView(
              children: <Widget>[
                WalkThrough(textContent: "images/walk_1.png"),
                WalkThrough(textContent: "images/walk_2.png"),
                WalkThrough(textContent: "images/walk_3.png"),
              ],
              onPageChanged: (value) {
                setState(() => currentIndexPage = value);
              },
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            height: 50,
            top: MediaQuery.of(context).size.height * 0.45,
            // left: MediaQuery.of(context).size.width * 0.35,
            child: Align(
              alignment: Alignment.center,
              child: DotsIndicator(
                  dotsCount: 3,
                  position: currentIndexPage,
                  decorator: DotsDecorator(
                      color: yellow_class_greyColor,
                      activeColor: yellow_class_colorPrimary)),
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            top: MediaQuery.of(context).size.height * 0.5,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(titles[currentIndexPage],
                      style: TextStyle(
                          fontFamily: fontBold,
                          fontSize: 20,
                          color: yellow_class_textColorPrimary)),
                  SizedBox(height: 10),
                  Center(
                      child: Text(subTitles[currentIndexPage],
                          style: TextStyle(
                              fontFamily: fontRegular,
                              fontSize: 18,
                              color: yellow_class_textColorSecondary),
                          textAlign: TextAlign.center)),
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      alignment: Alignment.center,
                      child: YellowClassButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MyHomePage(title: 'Yellow Class')));
                        },
                        textContent: yellow_class_Get_Started,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    child: Text("Login",
                        style: TextStyle(
                            fontSize: textSizeMedium,
                            decoration: TextDecoration.underline,
                            color: yellow_class_greyColor)),
                    onTap: () {
                      print("login");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => YellowClassLogin()));
                    },
                  )
                ],
              ),
            ),
          ),
          SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: Row(
                children: <Widget>[
                  /*
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  */
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WalkThrough extends StatelessWidget {
  final String textContent;

  WalkThrough({Key key, @required this.textContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: SizedBox(
        child: Stack(
          children: <Widget>[
            Image.asset("images/WalkBackImg.png",
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height) * 0.4),
            SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height) * 0.4,
                alignment: Alignment.center,
                child: Image.asset(
                  textContent,
                  width: 300,
                  height: (MediaQuery.of(context).size.height) * 0.3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
