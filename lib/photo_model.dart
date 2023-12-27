class PhotoModel {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  PhotoModel(this.albumId, this.id, this.title, this.url, this.thumbnailUrl);

  // Factory constructor to create an PhotoModel from a Map
  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      json['albumId'] as int,
      json['id'] as int,
      json['title'] as String,
      json['url'] as String,
      json['thumbnailUrl'] as String,
    );
  }
}
