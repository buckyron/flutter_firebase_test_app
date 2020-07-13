import 'package:firebase_auth/firebase_auth.dart';

class AuthServices{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<FirebaseUser> get user{
    return _auth.onAuthStateChanged;
  }

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
  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }

}