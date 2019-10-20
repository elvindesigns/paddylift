import 'package:flutter/material.dart';

class ImageViewerScreen extends StatelessWidget {
  final String image;
  ImageViewerScreen({this.image});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Container(
        child: Center(
            child: Image.asset(
          image,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.contain,
        )),
      ),
    );
  }
}
