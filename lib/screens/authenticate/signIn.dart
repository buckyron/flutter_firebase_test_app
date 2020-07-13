import 'package:firebasefluttertest/services/authServices.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In')
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text('Sign in Anonymously'),
            onPressed: () async{
              var result = await _auth.signInAnon();
              if(result == null){
                print("error signing in");
              }else{
                print('Signed in as');
                print(result);
              }
            },
          ),
        ),
      ),
    );
  }
}
