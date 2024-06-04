// gallery.dart

import 'package:flutter/material.dart';

class Gallery extends StatelessWidget {
  final List<String> images;
  const Gallery({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Image.asset('images/${images[index]}');
        },
      ),
    );
  }
}
