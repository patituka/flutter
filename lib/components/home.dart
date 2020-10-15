import 'package:flutter/material.dart';
import 'package:my_app/services/picture.service.dart';

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
          body: Container(
            child: FutureBuilder<List<dynamic>>(
                future: fetchAlbum(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return GridView.count(
                      crossAxisCount: 3,
                      children: List.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Center(
                              child: Draggable<Image>(
                                feedback: MyImage(snapshot.data[index]),
                                child: MyImage(snapshot.data[index]),
                                childWhenDragging: box,
                              ),
                            );
                          }),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        ));
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
