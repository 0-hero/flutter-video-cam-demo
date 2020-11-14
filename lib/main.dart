import 'package:flutter/material.dart';
import 'package:yellow_class/screens/chart.dart';
import 'package:yellow_class/screens/home.dart';
import 'package:yellow_class/screens/profile.dart';
import 'package:yellow_class/screens/search.dart';
import 'package:yellow_class/screens/video_screen.dart';
import 'package:yellow_class/screens/walkthrough.dart';
import 'package:yellow_class/utils/bottom_navigation_bar.dart';
import 'package:yellow_class/utils/colors.dart';
import 'package:yellow_class/video_player/mock_data.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: YellowClassWalkThrough(), //MyHomePage(title: 'Yellow Class'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;
  var pages = [
    Home(),
    Search(),
    Chart(),
    Profile(),
  ];
  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      print(selectedIndex);
      if (selectedIndex == 0) {
        print("Home");
      } else if (selectedIndex == 1) {
        print("Search");
      } else if (selectedIndex == 2) {
        print("Chart");
      } else if (selectedIndex == 3) {
        print("Profile");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: yellow_class_ShadowColor,
              offset: Offset.fromDirection(3, 1),
              spreadRadius: 1,
              blurRadius: 5)
        ]),
        child: YellowClassBottomNavigationBar(
          items: const <YellowClassBottomNavigationBarItem>[
            YellowClassBottomNavigationBarItem(
              icon: "images/home_navigation.svg",
            ),
            YellowClassBottomNavigationBarItem(
              icon: "images/search_navigation.svg",
            ),
            YellowClassBottomNavigationBarItem(
              icon: "images/chart_navigation.svg",
            ),
            YellowClassBottomNavigationBarItem(
              icon: "images/more_navigation.svg",
            ),
          ],
          currentIndex: selectedIndex,
          unselectedIconTheme:
              IconThemeData(color: yellow_class_textColorSecondary, size: 24),
          selectedIconTheme:
              IconThemeData(color: yellow_class_colorPrimary, size: 24),
          onTap: _onItemTapped,
          type: YellowClassBottomNavigationBarType.fixed,
        ),
      ),
      body: SafeArea(
        child: pages[selectedIndex],
      ),
    );
  }
}
