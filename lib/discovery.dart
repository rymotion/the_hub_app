import 'dart:async';
import 'package:flutter/material.dart';

class Discovery extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DiscoverState();

}

class _DiscoverState extends State<Discovery> {
  @override
  Widget build(BuildContext context) => new Scaffold(
    body: new Container(
      child: new Text('something here. 3'),
    ),
  );
}