import 'package:flutter/material.dart';
import 'package:yellow_class/utils/colors.dart';
import 'package:yellow_class/utils/constant.dart';
import 'package:yellow_class/utils/widget.dart';

class CustomDialog extends StatelessWidget {
  bool success;
  String content;
  CustomDialog(bool success, String content) {
    this.success = success;
    this.content = content;
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context, success, content),
    );
  }
}

dialogContent(BuildContext context, bool success, String content) {
  return Container(
    decoration: new BoxDecoration(
      color: Colors.white,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10.0,
          offset: const Offset(0.0, 10.0),
        ),
      ],
    ),
    width: MediaQuery.of(context).size.width,
    child: Column(
      mainAxisSize: MainAxisSize.min, // To make the card compact
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.centerRight,
              child: Icon(Icons.close, color: yellow_class_textColorPrimary)),
        ),
        success
            ? text("Success!",
                textColor: Colors.green,
                fontFamily: fontBold,
                fontSize: textSizeLarge)
            : text("Fail!",
                textColor: Colors.red,
                fontFamily: fontBold,
                fontSize: textSizeLarge),
        SizedBox(height: 24),
        success
            ? Image.asset(
                "images/success.png",
                color: Colors.green,
                width: 95,
                height: 95,
              )
            : Image.asset(
                "images/sad.png",
                color: Colors.red,
                width: 95,
                height: 95,
              ),
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: text(content,
              fontSize: textSizeMedium, maxLine: 2, isCentered: true),
        ),
        SizedBox(height: 30),
        Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          decoration: new BoxDecoration(
            color: yellow_class_colorPrimary,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(24),
          ),
          alignment: Alignment.center,
          child: text(success ? "Continue" : "Try again",
              textColor: yellow_class_white,
              fontFamily: fontMedium,
              fontSize: textSizeNormal),
        )
      ],
    ),
  );
}
