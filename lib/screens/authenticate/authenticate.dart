import 'package:firebasefluttertest/screens/authenticate/register.dart';
import 'package:flutter/material.dart';
import 'package:firebasefluttertest/screens/authenticate/signIn.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Register();
  }
}
