import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

final String accessURI =
    'https://capitol-music-360.cloudinary.auth0-extend.com/music-discovery-service/browse/';

http.IOClient _httpClient = new http.IOClient();

class Artists {
  final List<Post> returnedList;

  Artists({this.returnedList});
}

class Access {
  String accessExt = 'a?page=1&pageSize=10';
  Access();
  Access.getMore(String char, int prev){
    accessExt = char + '?page=${prev}&pageSize=10';
    fetchData();
  }
  Future<List<Post>> get getResults => fetchData();

  Future<List<Post>> fetchData() async {

    List<Post> resultedParse = [];

    try {
      String accessURL = accessURI + accessExt;
//      LIFE PRO TIP JUST WRAP EVERYTHING IN A MAP IF type '_InternalLinkedHashMap<String, dynamic>' is not a subtype of type 'List<dynamic>' in type cast
      http.Response response = await _httpClient.get(accessURL);
      Map<String, dynamic> responseJson = json.decode(response.body);
      print('${responseJson.runtimeType.toString()}');
      print('${responseJson['artists']}\n');
      Map<String, dynamic> artist = responseJson['artists'];
      print('${artist.runtimeType.toString()}\n');
      print('${artist['artist']}\n');
      List<dynamic> id = artist['artist'];
      print(id.runtimeType.toString());
      for (var x in id){
        print('$x\n');
        print('${x['id']}');
        resultedParse.add(new Post(artistId: x['id'],nameId: x['name'],sortName: x['sortName'],artistURL: x['url'],imageURL: x['image'],pop: x['popularity']));
      }
      return resultedParse;
    } catch (e) {
      print('\n${e.toString()}\n');
    }
    return resultedParse;
  }
}

class Post {
  String artistId;
  String nameId;
  String sortName;
  String artistURL;
  String imageURL;
  String pop;

  Post({this.artistId, this.nameId, this.sortName, this.artistURL, this.imageURL, this.pop});
}


