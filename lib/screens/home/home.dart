import 'package:flutter/material.dart';
import 'package:firebasefluttertest/services/authServices.dart';
class Home extends StatelessWidget {
  static const String id = "Home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () async {
                await AuthServices().signOut();
              },
              icon: Icon(Icons.person),
              label: Text('logout')
          )
        ],
      ),
    );
  }
}
