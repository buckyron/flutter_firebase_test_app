import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasefluttertest/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:firebasefluttertest/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  static const String id = "Wrapper";

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<FirebaseUser>(context);


    return user == null? Authenticate(): Home();
  }
}
