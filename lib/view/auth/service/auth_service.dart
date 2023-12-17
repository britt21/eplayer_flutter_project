import 'package:eplayer_flutter_mobile/helper/base_client.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  BaseClient baseClient = BaseClient();


  Future<User?> signupemailPass(String email, String pass) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      return credential.user;
    } on FirebaseAuthException catch  (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
    }
    return null;
  }

  Future<User?> signinEmailPass(String email, String pass) async {
    try {
      UserCredential credential =
          await auth.signInWithEmailAndPassword(email: email, password: pass);
      return credential.user;
    } on FirebaseAuthException catch  (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
    }
    return null;
  }
}
