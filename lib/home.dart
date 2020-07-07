import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter a search term'),
                  ),
                ),
                FlatButton(
                    color: Colors.blue, onPressed: () {}, child: Text('Search'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
