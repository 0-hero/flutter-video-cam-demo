import 'package:flutter/material.dart';
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
      title: 'Yellow Class Demo',
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
  var _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
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
              icon: "images/message_navigation.svg",
            ),
            YellowClassBottomNavigationBarItem(
              icon: "images/more_navigation.svg",
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedIconTheme:
              IconThemeData(color: yellow_class_textColorSecondary, size: 24),
          selectedIconTheme:
              IconThemeData(color: yellow_class_colorPrimary, size: 24),
          onTap: _onItemTapped,
          type: YellowClassBottomNavigationBarType.fixed,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          VideoScreen(mockData["items"][0]["trailer_url"])),
                );
              },
              child: Text('Final Screen', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
