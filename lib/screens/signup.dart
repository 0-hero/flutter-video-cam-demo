import 'package:flutter/material.dart';
import 'package:yellow_class/screens/login.dart';
import 'package:yellow_class/utils/colors.dart';
import 'package:yellow_class/utils/constant.dart';
import 'package:yellow_class/utils/extension.dart';
import 'package:yellow_class/utils/strings.dart';
import 'package:yellow_class/utils/widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class YellowClassSignUp extends StatefulWidget {
  @override
  _YellowClassSignUpState createState() => _YellowClassSignUpState();
}

class _YellowClassSignUpState extends State<YellowClassSignUp> {
  @override
  Widget build(BuildContext context) {
    changeStatusColor(yellow_class_layout_background);
    var width = MediaQuery.of(context).size.width;
    TextEditingController emailController = new TextEditingController();
    TextEditingController passwordController = new TextEditingController();
    TextEditingController nameController = new TextEditingController();
    return Scaffold(
      backgroundColor: yellow_class_layout_background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SafeArea(
            child: Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: yellow_class_colorPrimary,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
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
                            backgroundImage: AssetImage("images/profile.png"),
                            radius: width / 8.5),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: boxDecoration(
                            radius: 40,
                            showShadow: true,
                            bgColor: yellow_class_white),
                        child: TextFormField(
                          style: TextStyle(
                              fontSize: textSizeMedium,
                              fontFamily: fontRegular),
                          obscureText: false,
                          controller: nameController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(24, 18, 24, 18),
                            hintText: yellow_class_hint_full_name,
                            filled: true,
                            fillColor: yellow_class_white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: const BorderSide(
                                  color: yellow_class_white, width: 0.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: const BorderSide(
                                  color: yellow_class_white, width: 0.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      YellowClassEditTextStyle(
                          yellow_class_hint_email, emailController,
                          isPassword: false),
                      SizedBox(
                        height: 16,
                      ),
                      YellowClassEditTextStyle(
                          yellow_class_hint_password, passwordController,
                          isPassword: true),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        width: 120,
                        alignment: Alignment.center,
                        child: YellowClassButton(
                          onPressed: () async {
                            try {
                              User user = (await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text,
                              ))
                                  .user;
                              if (user != null) {
                                await FirebaseAuth.instance.currentUser
                                    .updateProfile(
                                        displayName: user.displayName);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            YellowClassLogin()));
                              }
                            } catch (e) {
                              print(e);
                              nameController.text = "";
                              passwordController.text = "";
                              emailController.text = "";
                              // TODO: alertdialog with error
                            }
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
