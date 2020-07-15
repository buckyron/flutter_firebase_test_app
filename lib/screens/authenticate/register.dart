import 'package:firebasefluttertest/services/authServices.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebasefluttertest/components/rounded_button.dart';
import 'package:firebasefluttertest/components/phoneField.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebasefluttertest/constants.dart';



class Register extends StatefulWidget {
  static const String id = "Register";

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthServices _auth = AuthServices();
  bool showSpinner = false;

  String phoneNo, verificationId, smsCode;

  bool codeSent = false;


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
              Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(hintText: 'Enter phone number'),
                    onChanged: (val) {
                      setState(() {
                        this.phoneNo = val;
                      });
                    },
                  )),
              codeSent ? Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(hintText: 'Enter OTP'),
                    onChanged: (val) {
                      setState(() {
                        this.smsCode = val;
                      });
                    },
                  )) : Container(),
              SizedBox(height: 10,),
              Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: RoundedButton(
                      text: codeSent ? 'Login':'Verify',
                      onPressed: () {
                        codeSent ? AuthServices().signInWithOTP(smsCode, verificationId):verifyPhone(phoneNo);
                      }))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> verifyPhone(phoneNo) async {
  final PhoneVerificationCompleted verified = (AuthCredential authResult) {
    AuthServices().signIn(authResult);
  };

  final PhoneVerificationFailed verificationfailed =
      (AuthException authException) {
        final snackBar = SnackBar(content: Text("Exception!! message:" + authException.message.toString()));
    Scaffold.of(context).showSnackBar(snackBar);  };

  final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
    this.verificationId = verId;
    setState(() {
      this.codeSent = true;
    });
  };

  final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
    this.verificationId = verId;
  };

  await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNo,
      timeout: const Duration(seconds: 5),
      verificationCompleted: verified,
      verificationFailed: verificationfailed,
      codeSent: smsSent,
      codeAutoRetrievalTimeout: autoTimeout);
}
}
