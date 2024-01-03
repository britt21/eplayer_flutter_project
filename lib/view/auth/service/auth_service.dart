import 'dart:convert';

import 'package:eplayer_flutter_mobile/helper/base_client.dart';
import 'package:eplayer_flutter_mobile/helper/base_contoller.dart';
import 'package:eplayer_flutter_mobile/view/auth/model/register/response/RegisterResponse.dart';
import 'package:eplayer_flutter_mobile/view/login/model/response/LoginResponse.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';


class AuthService with BaseController {
  FirebaseAuth auth = FirebaseAuth.instance;
  BaseClient baseClient = BaseClient();
  final introdata = GetStorage();



  Future<User?> signupemailPass(String email, String pass) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      return credential.user;
    } on FirebaseAuthException catch (e) {
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
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
    }
    return null;
  }


  Future<LoginResponse> loginUser(String email, String pass) async {

      var loginPayload =
      {
        "email": "${email}",
        "pass": "${pass}"
      };


      var response = await baseClient.post("loginUser", loginPayload).catchError(handleError);
      var data = json.decode(response);


      var respigot = LoginResponse.fromJson(data);

      introdata.write('email', respigot.body?.email);
      introdata.write('userid', respigot.body?.id);
      introdata.write('nickName', respigot.body?.nickName);
      introdata.write('balance', respigot.body?.wallet?.balance);
      introdata.write('bobis', "bob");


      print("IGOTRESPONSEHERE: ${respigot.body?.nickName}");
      print("IGOTRESPONSEHERE: ${respigot.body?.email}");
      print("IGOTRESPONSEHERE: ${respigot.body?.wallet}");
      print("IGOTRESPONSEHERE: ${respigot.body?.profilePicture}");
      print("IGOTRESPONSEHERECODE: ${respigot.responseCode}");
      print("IGOTRESPONSEHEREMSG: ${respigot.message}");
      return  respigot;



  }



  Future<RegisterResponse> signupUser(String email, String pass,  String nickname,  String profilePicture) async {
    try {
      var registerUser =
      {
        "email": "${email}",
        "password": "${pass}",
        "nickname": "${nickname}",
        "profilePicture": "${profilePicture}",
        "userId": {
          "timestamp": 0,
          "date": ""
        }
      };


      var response = await baseClient.post("registerNewUser", registerUser);
      var data = json.decode(response);

      var respigot = RegisterResponse.fromJson(data);


      print("IGOTRESPONSEHERECODE: ${respigot.responseCode}");
      print("IGOTRESPONSEHEREMSG: ${respigot.message}");


      return  respigot;
    } catch (error) {
      print("GDG ${error}");
      return Future.error(error);
    }

  }


}
