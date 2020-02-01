import 'package:flutter/material.dart';
import 'package:gallery/Config.dart';
import 'package:gallery/ListPhotos.dart';

class GalleryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GalleryScreenState();
}

class GalleryScreenState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(Config.ACTION_BAT_TITLE)),
        body: new ListPhotos());
  }
}
