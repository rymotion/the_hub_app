import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

final String accessURI = 'https://capitol-music-360.cloudinary.auth0-extend.com/music-discovery-service/';

class Artists {
  final List<Post> returnedList;
  Artists({this.returnedList});
}

class Post {
  final int artistId;
  final String nameId;
  final String sortName;
  final String artistURL;
  final String imageURL;
  final double pop;

  Post webResponse;

  Post({this.artistId, this.nameId, this.sortName, this.artistURL, this.imageURL, this.pop});

  Future<Post> get grabPost => fetchData();

  Future<Post> fetchData() async {
    final response = await http.get(accessURI);
    final responseJson = json.decode(response.body);
    return new Post.fromJson(responseJson);
  }

  factory Post.fromJson(Map<String, dynamic> json) {
    return new Post(
      artistId: json['id'],
      nameId: json['name'],
      sortName: json['sortName'],
      artistURL: json['url'],
      imageURL: json['image'],
      pop: json['popularity'],
    );
  }
}