import 'package:flutter/material.dart';
import 'package:my_app/models/picture.dart';

class Album extends StatelessWidget {
  final int index;
  final Picture picture;
  
  Album(this.index, this.picture);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Image.network(this.picture.urls.small,
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
