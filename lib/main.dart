import 'dart:async';
import 'package:flutter/material.dart';
import 'musicAccess.dart' as post;
import 'stream.dart' as stream;
import 'profile.dart' as profile;
import 'discovery.dart' as discover;
import 'saved.dart' as save;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'The Hub',
      theme: new ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.black38,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  Widget build(BuildContext context) => new MyTabber();

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
}

class MyTabber extends StatefulWidget {
  MyTabber({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _MyTabberState();
}

class _MyTabberState extends State<MyTabber>
    with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => new DefaultTabController(
      length: 4,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('MusicME'),
          bottom: new TabBar(controller: controller, tabs: [
            new Tab(
              icon: new Icon(Icons.audiotrack),
              text: 'The Feed',
            ),
            new Tab(
              icon: new Icon(Icons.adjust),
              text: 'Around Me',
            ),
            new Tab(
              icon: new Icon(Icons.people),
              text: 'Discover',
            ),
            new Tab(
              icon: new Icon(Icons.star),
              text: 'Saved',
            ),
          ]),
        ),
        body: new TabBarView(
          controller: controller,
          children: <Widget>[
            new stream.Stream(),
            new profile.Profile(),
            new discover.Discovery(),
            new save.Saved(),
          ],
        ),
      )
  );
}
