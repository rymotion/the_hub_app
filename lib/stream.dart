import 'dart:async';
import 'package:flutter/material.dart';
import 'musicAccess.dart';
import 'stream.dart' as stream;

class Stream extends StatefulWidget {
  Stream();

  @override
  State<StatefulWidget> createState() => new _StreamState();

}

class _StreamState extends State<Stream> {

  Post returnedPost;

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
      await returnedPost.fetchData().then((post){
        print('\n${post}\n');
      });
  }

  @override
  Widget build(BuildContext context) => new ListView.builder(itemCount: ,itemBuilder: ,);
}