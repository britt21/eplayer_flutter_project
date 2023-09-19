import 'package:eplayer_flutter_mobile/widgets/Utils.dart';
import 'package:eplayer_flutter_mobile/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../colors/color.dart';

class SignUpHome extends StatefulWidget {
  const SignUpHome({super.key});

  @override
  State<SignUpHome> createState() => _SignUpHomeState();
}

class _SignUpHomeState extends State<SignUpHome> {

  final passcontroller  = TextEditingController() ;
  final userNameController  = TextEditingController() ;
  final emailcontroller  = TextEditingController() ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EplayerAppBar("Signup"),
      body: SingleChildScrollView(
        child: Column(children: [

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Become the top best \nPlayer in the world",style: GoogleFonts.mulish(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Text("Username",style: GoogleFonts.mulish(color: Colors.black,fontWeight: FontWeight.bold),),
                ),
                AppEditText(etcontroller: userNameController,ethint: "username",),
              ],
            ),
          ),


           Padding(
            padding: const EdgeInsets.all(15.0),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Email Address",style: GoogleFonts.mulish(color: Colors.black,fontWeight: FontWeight.bold),),
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
              lit_purple, app_purple, "Signup", Colors.white, null,
                  () {


              }),







        ],),
      ),

    );
  }
}
