import 'dart:async';
import 'package:flutter/material.dart';
import 'musicAccess.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

http.IOClient _httpClient = new http.IOClient();

class Stream extends StatefulWidget {
  Stream();

  @override
  State<StatefulWidget> createState() => new _StreamState();
}

class _StreamState extends State<Stream> {
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

  Access returnedPost;

  List<Post> list = [];
  Post postMeta;

  void load() async {
    var access = Access();
    await access.fetchData().then((List<Post> x) {
      setState(() {
        list = x;
      });
    });
  }

  @override
  Widget build(BuildContext context) =>
      new Scaffold(
        body: new Container(
            child: new RefreshIndicator(
                child: new ListView.builder(
                    itemCount: list == null ? 0 : list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return new MaterialButton(
                        child: new Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new ListTile(
                              title: new Text('${list[index].nameId}'),
                            ),
                            new Image.network(
                              list[index].imageURL,
                              repeat: ImageRepeat.noRepeat,
                              scale: 1.0,
                            ),
                          ],
                        ),
                        color: Color.lerp(Colors.grey, Colors.amberAccent,
                            double.parse(list[index].pop)),
                        onPressed: () {
                          _openMusic(list[index].nameId);
                        },
                      );
                    }),
                onRefresh: _handleRefresh)),
      );

  Future<Null> _openMusic(String artist) async {
//    http.Response response = await _httpClient.get(
//        "https://api.spotify.com/v1/search?q=Muse&type=artist&market=US&limit=10&offset=5" -H "Accept: application/json" -H "Content-Type: application/json" -H "Authorization: Bearer BQDfS8Nl8Y_3E5oQ8RJdsgXBEWIxylECQAjHV6pvcnOjy4L4Pizvom1t0I71K6_tgOAkqWJHbL2-I2I1vZv81hWH-3fYPqAsuzlcN-ThBQ-w7lGU_0k9v88XGQ9N6XpSfSxG3wWc1FI");
//    Map<String, dynamic> responseJson = json.decode(response.body);
//    print('${responseJson.runtimeType.toString()}');
  }

  Future<Null> _handleRefresh() async {
    load();
    await new Future.delayed(new Duration(seconds: 10));
    return null;
  }
//  Widget build(BuildContext context) => new ListView.builder(itemCount: ,itemBuilder: ,);
}
