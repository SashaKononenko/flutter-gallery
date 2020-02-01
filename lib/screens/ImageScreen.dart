import 'package:flutter/material.dart';
import 'package:gallery/Config.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageScreen extends StatelessWidget {
  String _imageUrl;

  ImageScreen(this._imageUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        backgroundColor: Colors.black,
        body: new GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Center(
                child: new CachedNetworkImage(
              imageUrl: "${Config.BASE_URL}$_imageUrl",
              placeholder: (context, url) => new CircularProgressIndicator(),
              errorWidget: (context, url, error) => new Icon(Icons.error),
            ))));
  }
}
