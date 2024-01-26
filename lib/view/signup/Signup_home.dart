import 'dart:convert';

import 'package:eplayer_flutter_mobile/view/auth/service/auth_service.dart';
import 'package:eplayer_flutter_mobile/view/home/home.dart';
import 'package:eplayer_flutter_mobile/widgets/Utils.dart';
import 'package:eplayer_flutter_mobile/widgets/app_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../colors/color.dart';
import '../widget/error_dialog.dart';

class SignUpHome extends StatefulWidget {
  const SignUpHome({super.key});

  @override
  State<SignUpHome> createState() => _SignUpHomeState();
}

class _SignUpHomeState extends State<SignUpHome> {
  final passcontroller = TextEditingController();

  final userNameController = TextEditingController();

  final emailcontroller = TextEditingController();

  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EplayerAppBar("Signup"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Become the top best \nPlayer in the world",
                    style: GoogleFonts.mulish(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: Text(
                      "Username",
                      style: GoogleFonts.mulish(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  AppEditText(
                    etcontroller: userNameController,
                    ethint: "username",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email Address",
                    style: GoogleFonts.mulish(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  AppEditText(
                    etcontroller: emailcontroller,
                    ethint: "danbob@gmail.com",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Password",
                    style: GoogleFonts.mulish(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  EtPass(
                    etcontroller: passcontroller,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            AppButton("Signup", () {
              authSignup();
            }),
          ],
        ),
      ),
    );
  }

  Future<User?> signup() async {
    var email = emailcontroller.text;
    var pass = emailcontroller.text;
    print("UDATA: ${email} : ${pass}");
    User? user = await authService.signupemailPass(email, pass);

    if (user != null) {
      showmessage("SIGNUP SUCCESFUL");
      Get.to(Home());
    } else {
      showmessage("SIGNUP FAILED");
    }
    return user;
  }

  Future<void> authSignup() async {
    var email = emailcontroller.text;
    var pass = passcontroller.text;
    var userName = userNameController.text;

    print("UDATA: ${email} : ${pass}");

    var response = await authService.signupUser(email, pass, userName, "");

    if (response.responseCode == 200) {
      Get.to(Home());
    }else{
      showmessage(response.message);
    }
    // User? user = await authService.signinEmailPass(email, pass);
    // if (user != null) {
    //   showmessage("LOGIN SUCCESFUL");
    //   Get.to(() => Home());
    // } else {
    //   showmessage("LOGIN FAILED");
    // }
    // return user;
  }
}
