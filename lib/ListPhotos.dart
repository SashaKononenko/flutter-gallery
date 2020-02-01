import 'package:flutter/material.dart';
import 'package:gallery/GalleryItem.dart';
import 'package:gallery/API.dart';

final int STATUS_LOADING = 0;

class ListPhotos extends StatefulWidget {
  @override
  createState() => new ListPhotosState();
}

class ListPhotosState extends State<ListPhotos> {
  int _status;
  API api = new API();
  @override
  void initState() {
    _status = STATUS_LOADING;
    super.initState();
  }

  Future<void> downloadImage() async {
    await api.getNextPagePhotos();
    setState(() {
      _status = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_status == STATUS_LOADING) {
      downloadImage();
      return Icon(Icons.refresh, color: Colors.blue);
    } else
      return ListView.builder(itemBuilder: (context, index) {
        if (index >= api.photos.length) {
          downloadImage();
        }
        if (index < api.photos.length) return GalleryItem(api.photos[index]);
      });
  }
}
