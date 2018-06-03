import 'dart:async';
import 'package:flutter/material.dart';
import 'musicAccess.dart';
import 'Scrape.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

http.IOClient _httpClient = new http.IOClient();

class Discovery extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DiscoverState();

}

class _DiscoverState extends State<Discovery> {
  Access returnedPost;
  int curr = 1;
  String charchar = 'a';
  List<Post> list = [];
  Post postMeta;

  var rng = new Random();

  void load() async {
    var codeUnits = rng.nextInt(33)+89;

    setState(() {
      charchar = new String.fromCharCode(codeUnits);
    });

    var access = new Access.getMore(charchar, curr++);

    await access.fetchData().then((List<Post> x) {

      setState(() {
        list = x;
      });
    });
    await addMore();
  }

  Future<void> addMore() async {
    int i = 0;
    Scrape scrape = new Scrape();
    await scrape.getNavigation.then((List<ElementFormatter> returned){
      for (var elements in returned){
        if (0 == i%2){
          list.insert(i, new Post(artistURL: elements.elementURL));
          i++;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) => new Scaffold(
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
                    highlightColor: Colors.green,
                    color: Color.lerp(Colors.grey, Colors.amberAccent, double.parse(list[index].pop)),
                    onPressed: (){
                      _openMusic(list[index].nameId);
                    },
                  );
                }),
            onRefresh: _handleRefresh)),
  );

  Future<Null> _openMusic(String artist) async {
//    http.Response response = await _httpClient.get(
//        "https://api.spotify.com/v1/search?q=Muse&type=artist&market=US&limit=10&offset=5", clear"Accept: application/json", "Content-Type: application/json", "Authorization: Bearer BQDfS8Nl8Y_3E5oQ8RJdsgXBEWIxylECQAjHV6pvcnOjy4L4Pizvom1t0I71K6_tgOAkqWJHbL2-I2I1vZv81hWH-3fYPqAsuzlcN-ThBQ-w7lGU_0k9v88XGQ9N6XpSfSxG3wWc1FI");
//    Map<String, dynamic> responseJson = json.decode(response.body);
//    print('${responseJson.runtimeType.toString()}');
  }

  Future<Null> _handleRefresh() async {
    load();
    await new Future.delayed(new Duration(seconds: 10));
    return null;
  }
}