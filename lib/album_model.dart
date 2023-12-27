class AlbumModel {
  int userId;
  int id;
  String title;

  AlbumModel(this.userId, this.id, this.title);

  // Factory constructor to create an AlbumModel from a Map
  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
      json['userId'] as int,
      json['id'] as int,
      json['title'] as String,
    );
  }
}
