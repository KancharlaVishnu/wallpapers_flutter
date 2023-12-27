import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndividualPhotoScreen extends StatelessWidget {
  const IndividualPhotoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String photourl = Get.arguments as String;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Image.network(
          photourl,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}
