import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  MyPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: RichText(
        text: TextSpan(
          text: 'Hello ',
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(
                text: 'bold', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: ' world!'),
          ],
        ),
      ),
    );
  }
}
