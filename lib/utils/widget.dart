import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yellow_class/models/models.dart';
import 'package:yellow_class/utils/colors.dart';
import 'package:yellow_class/utils/constant.dart';

Widget text(String text,
    {var fontSize = textSizeMedium,
    textColor = yellow_class_textColorPrimary,
    var fontFamily = fontRegular,
    var isCentered = false,
    var maxLine = 1,
    var latterSpacing = 0.25,
    var textAllCaps = false,
    var isLongText = false}) {
  return Text(textAllCaps ? text.toUpperCase() : text,
      textAlign: isCentered ? TextAlign.center : TextAlign.start,
      maxLines: isLongText ? null : maxLine,
      style: TextStyle(
          fontFamily: fontFamily,
          fontSize: fontSize,
          color: textColor,
          height: 1.5,
          letterSpacing: latterSpacing));
}

Text profile(var label) {
  return Text(label,
      style: TextStyle(
          color: yellow_class_colorPrimary, fontSize: 18, fontFamily: 'Medium'),
      textAlign: TextAlign.center);
}

Row rowHeading(var label) {
  return Row(
    children: <Widget>[
      Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Text(label,
              style: TextStyle(
                  color: yellow_class_textColorPrimary,
                  fontSize: 18,
                  fontFamily: 'Bold'),
              textAlign: TextAlign.left)),
    ],
  );
}

Row profileText(var label, {var maxline = 1}) {
  return Row(
    children: <Widget>[
      Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
          child: text(label,
              fontSize: textSizeLargeMedium,
              textColor: yellow_class_textColorPrimary,
              maxLine: maxline)),
    ],
  );
}

Text headerText(var text) {
  return Text(text,
      maxLines: 2,
      style: TextStyle(
        fontFamily: fontBold,
        fontSize: 22,
        color: yellow_class_greyColor,
      ));
}

Text subHeadingText(var text) {
  return Text(
    text,
    style: TextStyle(
        fontFamily: fontRegular,
        fontSize: textSizeMedium,
        color: yellow_class_textColorSecondary),
  );
}

Text headingText(var text) {
  return Text(
    text,
    style: TextStyle(
        fontFamily: fontBold,
        fontSize: textSizeLargeMedium,
        color: yellow_class_textColorPrimary),
  );
}

class TopBar extends StatefulWidget {
  var titleName;

  TopBar(var this.titleName);

  @override
  State<StatefulWidget> createState() {
    return TopBarState();
  }
}

class TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Center(
                child: headerText(widget.titleName),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return null;
  }
}

List<YellowClassPeopleModel> getRecommended() {
  List<YellowClassPeopleModel> list = List<YellowClassPeopleModel>();

  var people = YellowClassPeopleModel();
  people.img = "images/walk_1.png";
  list.add(people);

  var people2 = YellowClassPeopleModel();
  people2.img = "images/walk_2.png";
  list.add(people2);

  var people3 = YellowClassPeopleModel();
  people3.img = "images/walk_3.png";
  list.add(people3);

  return list;
}

List<CourseModel> getList() {
  List<CourseModel> list = List<CourseModel>();
  CourseModel model1 = CourseModel();
  model1.courseName = "Yoga Class";
  model1.description =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.";
  model1.courseImage = "images/course1.png";

  CourseModel model2 = CourseModel();
  model2.courseName = "Ethical Hacking";
  model2.description =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.";
  model2.courseImage = "images/course2.jpg";

  CourseModel model3 = CourseModel();
  model3.courseName = "Programming";
  model3.description =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry.";
  model3.courseImage = "images/course3.webp";

  list.add(model1);
  list.add(model2);
  list.add(model3);

  return list;
}

BoxDecoration boxDecoration(
    {double radius = 2,
    Color color = Colors.transparent,
    Color bgColor = yellow_class_white,
    var showShadow = false}) {
  return BoxDecoration(
      color: bgColor,
      //gradient: LinearGradient(colors: [bgColor, whiteColor]),
      boxShadow: showShadow
          ? [
              BoxShadow(
                  color: yellow_class_ShadowColor,
                  blurRadius: 10,
                  spreadRadius: 2)
            ]
          : [BoxShadow(color: Colors.transparent)],
      border: Border.all(color: color),
      borderRadius: BorderRadius.all(Radius.circular(radius)));
}

Divider view() {
  return Divider(
    color: yellow_class_view_color,
    height: 0.5,
  );
}

Container YellowClassEditTextStyle(
    var hintText, TextEditingController textEditing,
    {isPassword = false}) {
  return Container(
    decoration: boxDecoration(
        radius: 40, showShadow: true, bgColor: yellow_class_white),
    child: TextFormField(
      style: TextStyle(fontSize: textSizeMedium, fontFamily: fontRegular),
      obscureText: isPassword,
      controller: textEditing,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(24, 18, 24, 18),
        hintText: hintText,
        filled: true,
        fillColor: yellow_class_white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(color: yellow_class_white, width: 0.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(color: yellow_class_white, width: 0.0),
        ),
      ),
    ),
  );
}

class YellowClassButton extends StatefulWidget {
  var textContent;
  VoidCallback onPressed;

  YellowClassButton({@required this.textContent, @required this.onPressed});

  @override
  State<StatefulWidget> createState() {
    return T9ButtonState();
  }
}

class T9ButtonState extends State<YellowClassButton> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: widget.onPressed,
        textColor: yellow_class_white,
        elevation: 4,
        color: yellow_class_colorPrimary,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: const EdgeInsets.all(0.0),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(80.0)),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.textContent,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ));
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}

Widget classOption(var icon, var heading) {
  return Padding(
    padding: EdgeInsets.fromLTRB(16, 10, 16, 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              decoration: boxDecoration(
                  bgColor: yellow_class_white, radius: 8, showShadow: true),
              width: 40,
              height: 40,
              padding: EdgeInsets.all(10),
              child: SvgPicture.asset(
                icon,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            text(heading,
                textColor: yellow_class_textColorPrimary,
                fontSize: textSizeLargeMedium,
                fontFamily: fontSemibold),
          ],
        ),
        Icon(
          Icons.keyboard_arrow_right,
          color: yellow_class_textColorSecondary,
        ),
      ],
    ),
  );
}

Widget classAward(var icon, var bgColor) {
  return Container(
    margin: EdgeInsets.only(right: 10),
    width: 35,
    height: 35,
    decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        icon,
      ),
    ),
  );
}
