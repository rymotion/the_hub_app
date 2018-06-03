import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

final String accessURI =
    'https://capitol-music-360.cloudinary.auth0-extend.com/music-discovery-service/browse/a?page=5&pageSize=10';

http.IOClient _httpClient = new http.IOClient();

class Artists {
  final List<Post> returnedList;

  Artists({this.returnedList});
}

class Access {
  Access() {
    fetchData();
  }

  void fetchData() async {
    try {
//      LIFE PRO TIP JUST WRAP EVERYTHING IN A MAP IF type '_InternalLinkedHashMap<String, dynamic>' is not a subtype of type 'List<dynamic>' in type cast
      http.Response response = await _httpClient.get(accessURI);
      Map<String, dynamic> responseJson = json.decode(response.body);
      print('${responseJson.runtimeType.toString()}');
      print('${responseJson['artists']}\n');
      Map<String, dynamic> artist = responseJson['artists'];
      print('${artist['artist']}\n');
      List<dynamic> id = artist['artist'];
      for (var x in id){
        print('$x\n');
      }
    } catch (e) {
      print('\n${e.toString()}\n');
    }
//    return new Post.fromJson(responseJson);
  }
}

class Post {
  int artistId;
  String nameId;
  String sortName;
  String artistURL;
  String imageURL;
  double pop;

  Post.fromJson(Map json) {
    this.artistId = json['id'];
    this.nameId = json['name'];
    this.sortName = json['sortName'];
    this.artistURL = json['url'];
    this.imageURL = json['image'];
    this.pop = json['popularity'];
  }
}
