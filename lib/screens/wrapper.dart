import 'package:firebasefluttertest/services/authServices.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  static const String id = "Wrapper";

  @override
  Widget build(BuildContext context) {


    return  AuthServices().handleAuth();
  }
}
