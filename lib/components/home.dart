import 'package:flutter/material.dart';

import 'image.dart';

class Home extends StatelessWidget {
  final title = 'My gallery';

  @override
  Widget build(BuildContext context) {
    const box = SizedBox(
      width: 120,
      height: 120,
      child: const DecoratedBox(
        decoration: const BoxDecoration(color: Colors.blueGrey),
      ),
    );
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Colors.pink,
        ),
        body: GridView.count(
          crossAxisCount: 3,
          children: List.generate(30, (index) {
            return Center(
              child: Draggable<Image>(
                feedback: MyImage(),
                child: MyImage(),
                childWhenDragging: box,
              ),
            );
          }),
        ),
      ),
    );
  }
}

class Picture extends StatefulWidget {
  @override
  _PictureState createState() => _PictureState();
}

class _PictureState extends State<Picture> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
