import 'package:gallery/Photo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:gallery/Config.dart';

class API {
  List<Photo> photos = new List<Photo>();
  int _page = 0;
  Future _getPhotos() async {
    await http.get('https://api.unsplash.com/photos?page=$_page', headers: {
      'Authorization':
          'Client-ID ${Config.ACCESS_TOKEN}'
    }).then((response) {
      print("Response status: ${response.statusCode}");
      Iterable list = json.decode(response.body);
      List<Photo> newPhotos =
          list.map((model) => Photo.fromJson(model)).toList();
      photos.addAll(newPhotos);
    }).catchError((error) {
      print("Error: $error");
    });
  }

  Future getNextPagePhotos() async {
    _page++;
    await _getPhotos();
  }
}
