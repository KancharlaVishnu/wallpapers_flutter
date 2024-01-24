import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wallpapers_flutter/route_manager.dart';
import 'photo_model.dart';

class PhotosScreen extends StatefulWidget {
  const PhotosScreen({Key? key}) : super(key: key);

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  List<PhotoModel> photoList = [];
  int albumId = Get.arguments as int;

  Future<List<PhotoModel>> fetchPhotos() async {
    final response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/albums/$albumId/photos'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<PhotoModel> photos =
          data.map((photoJson) => PhotoModel.fromJson(photoJson)).toList();
      return photos;
    } else {
      throw Exception('Failed to load photos');
    }
  }

  @override
  void initState() {
    fetchPhotos().then((photos) {
      setState(() {
        photoList = photos;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          for (int i = 0; i < photoList.length; i++) ...{
            photoItem(photoList[i]),
          }
        ],
      ),
    );
  }

  Widget photoItem(PhotoModel model) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RouteManager.individualphotoscreen, arguments: model.url);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        color: Colors.teal[100],
        child: Image.network(
          model.url,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}
