import 'package:flutter/material.dart';
import 'package:gallery/screens/GalleryScreen.dart';
import 'package:gallery/screens/ImageScreen.dart';
import 'package:gallery/Config.dart';

void main() {
  runApp(MaterialApp(
    theme: Config.themeData,
    initialRoute: '/',
    routes: {
      '/': (BuildContext context) => GalleryScreen(),
    },
    onGenerateRoute: (routeSettings) {
      var path = routeSettings.name.split('/');

      if (path[1] == "photo") {
        return new MaterialPageRoute(
          builder: (context) => new ImageScreen(path[2]),
          settings: routeSettings,
        );
      }
    },
  ));
}
