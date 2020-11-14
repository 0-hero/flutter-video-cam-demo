import 'package:flutter/material.dart';
import 'package:yellow_class/models/models.dart';
import 'package:yellow_class/utils/colors.dart';
import 'package:yellow_class/utils/constant.dart';
import 'package:yellow_class/utils/extension.dart';
import 'package:yellow_class/utils/strings.dart';
import 'package:yellow_class/utils/widget.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<YellowClassPeopleModel> mList2;

  @override
  void initState() {
    super.initState();
    mList2 = getRecommended();
  }

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
                    decoration: boxDecoration(
                        showShadow: true,
                        bgColor: yellow_class_white,
                        radius: 0),
                    padding: EdgeInsets.fromLTRB(12, 16, 16, 12),
                    margin: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Icon(Icons.search,
                                  color: yellow_class_colorPrimary, size: 20),
                            ),
                            Text(yellow_class_hint_search,
                                style: TextStyle(
                                    fontSize: textSizeMedium,
                                    color: yellow_class_textColorSecondary)),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(yellow_class_lbl_filter,
                                style: TextStyle(
                                    fontSize: textSizeMedium,
                                    color: yellow_class_colorPrimary)),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Icon(Icons.close,
                                  color: yellow_class_textColorSecondary,
                                  size: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    child: text(yellow_class_lbl_recommended,
                        fontFamily: fontBold,
                        fontSize: textSizeLargeMedium,
                        textColor: yellow_class_textColorPrimary),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.2,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: mList2.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Recommended(mList2[index], index);
                        }),
                  ),
                ],
              ),
            ),
          ),
          TopBar("Search"),
        ],
      ),
    );
  }
}

class Recommended extends StatelessWidget {
  YellowClassPeopleModel model;

  Recommended(YellowClassPeopleModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: 16, right: 8),
      child: CircleAvatar(
        radius: w * 0.1,
        backgroundImage: AssetImage(model.img),
      ),
    );
  }
}
