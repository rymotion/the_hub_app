import 'dart:async';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) => new SafeArea(child: new Container(
    padding: const EdgeInsets.all(10.0),
    child: new Text("LoL, data"),
  ));
}