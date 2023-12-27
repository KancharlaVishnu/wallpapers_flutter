import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpapers_flutter/albums_screen.dart';
import 'package:wallpapers_flutter/individual_photo_screen.dart';
import 'package:wallpapers_flutter/photos_screen.dart';
import 'package:wallpapers_flutter/route_manager.dart';
import 'package:wallpapers_flutter/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: RouteManager.splashscreen, page: () => SplashScreen()),
        GetPage(name: RouteManager.albumsscreen, page: () => AlbumsScreen()),
        GetPage(name: RouteManager.photosscreen, page: () => PhotosScreen()),
        GetPage(
            name: RouteManager.individualphotoscreen,
            page: () => IndividualPhotoScreen()),
      ],
      initialRoute: RouteManager.splashscreen,
    );
  }
}
