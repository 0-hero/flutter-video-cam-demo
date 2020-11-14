import 'package:flutter/material.dart';
import 'package:flutter_volume_slider/flutter_volume_slider.dart';
import 'package:yellow_class/models/models.dart';
import 'package:yellow_class/screens/video_screen.dart';
import 'package:yellow_class/utils/colors.dart';
import 'package:yellow_class/utils/constant.dart';
import 'package:yellow_class/utils/extension.dart';
import 'package:yellow_class/utils/widget.dart';
import 'package:yellow_class/video_player/mock_data.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CourseModel> mListings;

  @override
  void initState() {
    super.initState();
    mListings = getList();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(yellow_class_layout_background);
    return Scaffold(
      backgroundColor: yellow_class_layout_background,
      body: Container(
        color: yellow_class_backgroundColor,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                TopBar("Home"),
                FlutterVolumeSlider(
                  display: Display.HORIZONTAL,
                  sliderActiveColor: Colors.blue,
                  sliderInActiveColor: Colors.grey,
                ),
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: mListings.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return CourseList(mListings[index], index);
                      }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CourseList extends StatelessWidget {
  CourseModel model;

  CourseList(CourseModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
        decoration: boxDecoration(
          radius: 10,
          showShadow: true,
        ),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                        child: Image.asset(
                          model.courseImage,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                              child: headingText(
                            model.courseName,
                          )),
                          //Image.asset(t3_ic_search)
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      text(model.description,
                          textColor: yellow_class_textColorPrimary,
                          fontSize: textSizeMedium,
                          maxLine: 2),
                    ],
                  ),
                ),
                RaisedButton(
                  textColor: yellow_class_white,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0))),
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: <Color>[
                        yellow_class_colorPrimary,
                        yellow_class_colorPrimaryDark
                      ]),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          "Play Video",
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VideoScreen(
                                mockData["items"][0]["trailer_url"])));
                  },
                )
              ],
            ),
          ],
        ));
  }
}
