import 'package:flutter/material.dart';
import 'package:got_nagpur/got_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Nagpur GOT",
      theme: ThemeData(
        primaryColor: Colors.amberAccent,
        accentColor: Colors.black,
        fontFamily: "Pacifico",
      ),
      debugShowCheckedModeBanner: false,
      home: GotPage(),
    );
  }
}
