import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebasefluttertest/components/rounded_button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebasefluttertest/constants.dart';
import 'package:firebasefluttertest/screens/authenticate/signIn.dart';


class Register extends StatefulWidget {
  static const String id = "Register";

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String email;
  String password;
  bool showSpinner = false;
  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kSecondaryColor),
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextFormField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kSecondaryColor),
                onChanged: (value) {
                    password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                text: 'Register',
                colour: kSecondaryColor,
                onPressed: () async{
//                  setState(() {
//                    showSpinner = true;
//                  });
//                  try{
//                    final newUser =await  _auth.createUserWithEmailAndPassword(email: email, password: password);
//                    if(newUser != null){
//                      Navigator.pushNamed(context, ChatScreen.id);
//                    }
//                    setState(() {
//                      showSpinner = false;
//                    });
//                  }
//                  catch(e){
//                    print(e);
//                  }
               },
              ),
              InkWell(
                child: Text(
                    'Already have an account?',
                  style: TextStyle(
                      color: kSecondaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),

                ),
                onTap: (){
                  Navigator.popAndPushNamed(context, SignIn.id);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
