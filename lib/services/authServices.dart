import 'package:firebase_auth/firebase_auth.dart';

class AuthServices{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in  anonymous

  Future signInAnon() async{
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return user;
    }catch (e){
      print(e.toString());
      return null;
    }
  }

  // sign in using email & password

  // register using email & password

  // sign out

}