import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wallpapers_flutter/route_manager.dart';

import 'album_model.dart';

class AlbumsScreen extends StatefulWidget {
  const AlbumsScreen({Key? key}) : super(key: key);

  @override

  State<AlbumsScreen> createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  List<AlbumModel> albumList = [];

  Future<List<AlbumModel>> fetchAlbums() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<AlbumModel> albums =
          data.map((albumJson) => AlbumModel.fromJson(albumJson)).toList();
      return albums;
    } else {
      throw Exception('Failed to load albums');
    }
  }

  @override
  void initState() {
    fetchAlbums().then((albums) {
      // Do something with the albums, e.g., update the state
      setState(() {
        // Assuming you have a List<AlbumModel> variable in your state class
        albumList = albums;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: ListView.builder(
        itemCount: albumList.length,
        itemBuilder: (context, index) {
          AlbumModel album = albumList[index];
          return GestureDetector(
            onTap: (){
              Get.toNamed(
                RouteManager.photosscreen,arguments:  album.id
              );
            },
            child: ListTile(
              title:Text(album.id.toString(),style:TextStyle(color:Colors.white60),),
              subtitle: Text(album.title,style: TextStyle(color: Colors.white),),
              // Add more details or customization as needed
            ),
          );
        },
      ),
    );
  }
}
