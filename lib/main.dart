import 'package:flutter/material.dart';
import 'package:yellow_class/screens/video_screen.dart';
import 'package:yellow_class/video_player/mock_data.dart';
import 'package:yellow_class/screens/login.dart';

void main() {
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
      home: YellowClassLogin(), //MyHomePage(title: 'Yellow Class'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
