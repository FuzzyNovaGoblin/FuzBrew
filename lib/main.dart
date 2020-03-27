import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
              child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(child: Text("1 ON"), onPressed: press1ON),
            RaisedButton(child: Text("1 OFF"), onPressed: press1OFF)
          ],
        ),
      ),
    );
  }
}


void press1ON() async{
  Socket sock = await Socket.connect("dev.fuzytech.com", 38999);
  sock.add(utf8.encode("1on"));
  sock.close();
}
void press1OFF() async{
  Socket sock = await Socket.connect("dev.fuzytech.com", 38999);
  sock.add(utf8.encode("1off"));
  sock.close();
}