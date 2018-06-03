import 'dart:async';
import 'package:flutter/material.dart';
import 'musicAccess.dart';

class Stream extends StatefulWidget {
  Stream();

  @override
  State<StatefulWidget> createState() => new _StreamState();
}

class _StreamState extends State<Stream> {
  Access returnedPost;

  Post postMeta;

  @override
  void initState() {
    // TODO: implement initState
    load();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void load() async {
//    await returnedPost.grabPost.then((Post x) {
//      setState(() {
//        postMeta = x;
//      });
//    });
    new Access();
  }

  @override
  Widget build(BuildContext context) => new Scaffold(
        body: new Container(
          child: new Text('something here.'),
        ),
      );
//  Widget build(BuildContext context) => new ListView.builder(itemCount: ,itemBuilder: ,);
}
