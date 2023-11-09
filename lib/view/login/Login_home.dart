import 'package:eplayer_flutter_mobile/view/home/dashboard.dart';
import 'package:eplayer_flutter_mobile/widgets/Utils.dart';
import 'package:eplayer_flutter_mobile/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../colors/color.dart';
import '../home/home.dart';

class LoginHome extends StatefulWidget {
  const LoginHome({super.key});

  @override
  State<LoginHome> createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome> {

  final passcontroller  = TextEditingController() ;
  final userNameController  = TextEditingController() ;
  final emailcontroller  = TextEditingController() ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EplayerAppBar("Login"),
      body: ListView(children: [

         Padding(
          padding: const EdgeInsets.only(top: 25.0,left: 15,right: 15),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Login to your\nEplayer account",style: GoogleFonts.mulish(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Text("Email Address",style: GoogleFonts.mulish(color: Colors.black,fontWeight: FontWeight.bold),),
              ),
              AppEditText(etcontroller: emailcontroller,ethint: "danbob@gmail.com",),

            ],
          ),
        ),


         Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Password",style: GoogleFonts.mulish(color: Colors.black,fontWeight: FontWeight.bold),),
              EtPass(etcontroller: passcontroller,),

            ],
          ),
        ),
        SizedBox(height: 20,),
        AppButton(
              "Login",
                () {
              Get.to(Home());

            }),







      ],),

    );
  }
}
