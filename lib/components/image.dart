import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      child: Image.network(
        "https://images.unsplash.com/photo-1547721064-da6cfb341d50",
        fit: BoxFit.cover,
      ),
    );
  }
}
