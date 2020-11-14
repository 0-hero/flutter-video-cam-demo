import 'dart:ui';
import 'package:flutter/material.dart';

class YellowClassWalk {
  String img;
}

class YellowClassCategoryModel {
  var img = "";
  var name = "";
}

class YellowClassFeaturedModel {
  var img = "";
  var name = "";
  var price = "";
  var strikePrice = "";
  var type;
}

class YellowClassPeopleModel {
  var img = "";
  var name = "";
  var points = "";
  var isOnline = false;
  var subject = "";
  var email = "";
  var frd = "";
}

class YellowClassBadgeModel {
  var img = "";
  Color color;

  var name = "";
  var comment = "";
  var isLocked = false;
}

class YellowClassContentModel {
  var name = "";
  var subtitle = "";
  var type = "";
}

class YellowClassCoursesModel {
  var name = "";
  var img = "";
}

class YellowClassChatModel {
  var name = "";
  var msg = "";
  var img = "";
  var isOnline = false;
}

class YellowClassLectureModel {
  var no = "";
  var title = "";
  var subtitle = "";
  var type = "";
}

class ChatModel {
  String id;
  String message;

  ChatModel(this.id, this.message);
}

List<YellowClassWalk> walkImg() {
  List<YellowClassWalk> list = List<YellowClassWalk>();

  var img1 = YellowClassWalk();
  img1.img = "images/walk_1.png";
  list.add(img1);

  var img2 = YellowClassWalk();
  img2.img = "images/walk_2.png";
  list.add(img2);

  var img3 = YellowClassWalk();
  img3.img = "images/walk_3.png";
  list.add(img3);

  return list;
}
