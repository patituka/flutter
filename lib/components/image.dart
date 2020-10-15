import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  final int index;

  MyImage(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Image.network(
            "https://source.unsplash.com/featured/nature,water",
              width: 120, height: 120, fit: BoxFit.cover),
          Container(
            margin: EdgeInsets.only(top: 20.0),
          ),
          Text(
            index.toString(),
            style: TextStyle(color: Colors.indigo, fontSize: 18.0),
          )
        ],
      ),
    );
  }
}
