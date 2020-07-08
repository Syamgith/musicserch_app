import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const apiurl = 'https://itunes.apple.com/search?term=';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String textEntered;
  String searchTerm;

  Future searchSong(String searchTerm) async {
    http.Response response = await http.get('$apiurl$searchTerm&limit=25');
    if (response.statusCode == 200) {
      print('Sucess ${response.statusCode}');
      var decodedBody = jsonDecode(response.body);
      print(decodedBody['results'][0]['artistName']);
      return decodedBody;
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
                      textEntered = text;
                    },
                  ),
                ),
                RaisedButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      side: BorderSide(color: Colors.black)),
                  onPressed: () {
                    setState(() {
                      searchTerm = textEntered;
                    });
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
            searchTerm != null
                ? FutureBuilder(
                    future: searchSong(searchTerm),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return CircularProgressIndicator();
                      } else {
                        return Flexible(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (_, index) => Text(
                                '${snapshot.data['results'][0]['artistName']}'),
                            itemCount: 8,
                          ),
                        );
                      }
                    })
                : Text('Discover music'),
          ],
        ),
      ),
    );
  }
}
