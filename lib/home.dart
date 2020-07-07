import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 16.0,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 10.0,
                ),
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Search music'),
                  ),
                ),
                RaisedButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      side: BorderSide(color: Colors.black)),
                  onPressed: () {},
                  child: Text('Search'),
                ),
                SizedBox(
                  width: 10.0,
                )
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            Flexible(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (_, index) => FlutterLogo(),
                itemCount: 8,
              ),
            )
          ],
        ),
      ),
    );
  }
}
