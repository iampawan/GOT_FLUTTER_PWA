import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GotPage extends StatefulWidget {
  @override
  _GotPageState createState() => _GotPageState();
}

class _GotPageState extends State<GotPage> {
  var data;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var res =
        await http.get("http://api.tvmaze.com/singlesearch/shows?q=game-of-thrones&embed=episodes");
    print(res.body);
    data = jsonDecode(res.body);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: Text("Nagpur GOT"),
        elevation: 0.0,
      ),
      body: data != null
          ? Column(
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width > 600 ? 150 : 70,
                    backgroundImage: NetworkImage(data["image"]["original"]),
                  ),
                ),
                Text(data["name"]),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GridView.builder(
                      itemCount: data["_embedded"]["episodes"].length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
                      ),
                      itemBuilder: (context, index) {
                        var episode = data["_embedded"]["episodes"][index];
                        return Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          clipBehavior: Clip.antiAlias,
                          color: Colors.amberAccent,
                          child: Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(),
                                child: Image.network(
                                  episode["image"]["original"],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 10.0,
                                left: 10.0,
                                child: Text(
                                  episode["name"],
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
