import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class MusicTile extends StatefulWidget {
  MusicTile();

  @override
  State<StatefulWidget> createState() => _MusicTileState();

}

class _MusicTileState extends State<MusicTile> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  }
  Future<Null> _openMusic(String artist,) async {
    http.Response response = await _httpClient.get(
        "https://api.spotify.com/v1/search?q=Muse&type=artist&market=US&limit=10&offset=5" -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer BQDfS8Nl8Y_3E5oQ8RJdsgXBEWIxylECQAjHV6pvcnOjy4L4Pizvom1t0I71K6_tgOAkqWJHbL2-I2I1vZv81hWH-3fYPqAsuzlcN-ThBQ-w7lGU_0k9v88XGQ9N6XpSfSxG3wWc1FI");
    Map<String, dynamic> responseJson = json.decode(response.body);
    print('${responseJson.runtimeType.toString()}');
  }
}