import 'package:flutter/material.dart';
import 'package:gallery/Photo.dart';
import 'package:gallery/screens/ImageScreen.dart';
import 'package:gallery/Config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gallery/HexColor.dart';

class GalleryItem extends StatelessWidget {
  final Photo _photo;
  GalleryItem(this._photo);
  @override
  Widget build(BuildContext context) {
    if (_photo.urlSmallImage != null && _photo.urlSmallImage != '')
      return new Container(
          color: HexColor(_photo.color),
          height: 100.0,
          child: new Row(children: [
            new GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (BuildContext context, _, __) =>
                              ImageScreen(_photo.urlFullImage),
                          transitionsBuilder: (___, Animation<double> animation,
                              ____, Widget child) {
                            return FadeTransition(
                              opacity: animation,
                              child: ScaleTransition(
                                  scale: animation, child: child),
                            );
                          }));
                },
                child: CachedNetworkImage(
                    imageUrl: "${Config.BASE_URL}${_photo.urlSmallImage}",
                    placeholder: (context, url) =>
                        new CircularProgressIndicator(),
                    errorWidget: (context, url, error) => new Icon(Icons.error),
                    width: 100.0,
                    height: 100.0,
                    fit: BoxFit.cover)),
            new Expanded(
                child: new Container(
                    padding: new EdgeInsets.all(5.0),
                    child: new Column(children: [
                      new Text(_photo.authorName,
                          style: new TextStyle(fontSize: 20.0),
                          overflow: TextOverflow.ellipsis),
                      new Expanded(
                          child: new Text(
                        _photo.title,
                        softWrap: true,
                        textAlign: TextAlign.justify,
                      ))
                    ])))
          ]));

    return new Container(
        color: Colors.black12,
        height: 100.0,
        child: new Row(children: [
          new Expanded(
              child: new Container(
                  padding: new EdgeInsets.all(5.0),
                  child: new Column(children: [
                    new Text(_photo.authorName,
                        style: new TextStyle(fontSize: 20.0),
                        overflow: TextOverflow.ellipsis),
                    new Expanded(
                        child: new Text(
                      _photo.title,
                      softWrap: true,
                      textAlign: TextAlign.justify,
                    ))
                  ])))
        ]));
  }
}
