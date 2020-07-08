import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const apiurl = 'https://itunes.apple.com/search?term=';

class Home extends StatelessWidget {
  String searchTerm;
  String song;
  String artist;
  String imageurl;

  Future searchSong(String searchTerm) async {
    http.Response response = await http.get('$apiurl$searchTerm');
    if (response.statusCode == 200) {
      print('Sucess ${response.statusCode}');
      var decodedBody = jsonDecode(response.body);
      print(decodedBody);
      //double rate = decodedBody['rate'];
    } else {
      print('failed ${response.statusCode}');
      return;
    }
  }

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
                    onChanged: (text) {
                      searchTerm = text;
                    },
                  ),
                ),
                RaisedButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      side: BorderSide(color: Colors.black)),
                  onPressed: () {
                    searchSong(searchTerm);
                  },
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
