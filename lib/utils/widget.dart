import 'package:flutter/material.dart';
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

Container YellowClassEditTextStyle(var hintText, {isPassword = false}) {
  return Container(
    decoration: boxDecoration(
        radius: 40, showShadow: true, bgColor: yellow_class_white),
    child: TextFormField(
      style: TextStyle(fontSize: textSizeMedium, fontFamily: fontRegular),
      obscureText: isPassword,
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
