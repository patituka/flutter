import 'package:flutter/material.dart';
import 'package:my_app/services/picture.service.dart';

class MyImage extends StatelessWidget {
  final int index;
  final Album album;
  
  MyImage(this.index, this.album);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Image.network(this.album.urls.small,
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
