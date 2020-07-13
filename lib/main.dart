import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasefluttertest/services/authServices.dart';
import 'package:flutter/material.dart';
import 'screens/wrapper.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser>.value(
      value: AuthServices().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
