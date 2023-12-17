import 'package:eplayer_flutter_mobile/helper/base_client.dart';
import 'package:eplayer_flutter_mobile/view/home/dashboard.dart';
import 'package:eplayer_flutter_mobile/view/widget/error_dialog.dart';
import 'package:eplayer_flutter_mobile/widgets/Utils.dart';
import 'package:eplayer_flutter_mobile/widgets/app_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../colors/color.dart';
import '../auth/service/auth_service.dart';
import '../home/home.dart';

class LoginHome extends StatefulWidget {
  const LoginHome({super.key});

  @override
  State<LoginHome> createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome> {
  final passcontroller = TextEditingController();

  final userNameController = TextEditingController();

  final emailcontroller = TextEditingController();

  AuthService authService = AuthService();

  BaseClient baseClient = BaseClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EplayerAppBar("Login"),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login to your\nEplayer account",
                  style: GoogleFonts.mulish(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Text(
                    "Email Address",
                    style: GoogleFonts.mulish(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
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
          AppButton("Login", () async {
          var result =  await  baseClient.get("/odos");
          print("GOTTHIS: ${result}");

          }),
        ],
      ),
    );
  }

  Future<User?> login() async {
    var email = emailcontroller.text;
    var pass = emailcontroller.text;
    print("UDATA: ${email} : ${pass}");
    User? user = await authService.signinEmailPass(email, pass);

    if (user != null) {
      showmessage("LOGIN SUCCESFUL");
      Get.to(() => Home());
    } else {
      showmessage("LOGIN FAILED");
    }
    return user;
  }
}
