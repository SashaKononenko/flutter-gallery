class Photo {
  final String id;
  final String authorName;
  final String title;
  final String urlSmallImage;
  final String urlFullImage;
  final String color;

  Photo(this.id, this.authorName, this.title, this.urlSmallImage,
      this.urlFullImage, this.color);

  Photo.fromJson(Map json)
      : id = json['id'],
        authorName = json['user']['name'],
        title = json['description'] != null
            ? json['description']
            : (json['alt_description'] != null ? json['alt_description'] : ''),
        urlSmallImage = json['urls']['small'].toString().split('com/')[1],
        urlFullImage = json['urls']['full'].toString().split('com/')[1],
        color = json['color'];
}
