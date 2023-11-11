import 'package:flutter/material.dart';

import '../../colors/color.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../colors/color.dart';
import '../../drawables/pngs.dart';
import '../../font/font.dart';
import '../../font/fonts.dart';
import '../../widgets/app_button.dart';




Future gamebotomsheet(BuildContext context, bool dissmiss,name,amount,VoidCallback isaccepted){
  return showModalBottomSheet(
      isDismissible: false,
      backgroundColor: etbg,
      context: context, builder: (BuildContext context){
    return Container(height: 320,
        child: Center(child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                width: 75, // Set the desired width
                height: 75, // Set the desired height
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: app_purple,
                    width: 3.0, // Adjust the width of the border as needed
                  ),
                ),
                child: Center(
                  child: Text(
                    "30",
                    style: GoogleFonts.mulish(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 40.0,right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text("Player: ",style: midfontblack,),
                  Text("${name}",style: midfontblack,)
                ],),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0,right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text("Bid: ",style: midfontblack,),
                  Text("${amount}",style: midfontblack,)
                ],),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  child: ClipOval(
                    child: Image.asset(
                      femaleboxer,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

              ],),

            Expanded(
              child: Row(
                children: [
                  Expanded(child: AppButtonDeep( "Dismiss" ,(){ Navigator.pop(context);})),
                  Expanded(child: AppButton( "More details" ,isaccepted)),

                ],
              ),
            ),
          ],
        )
        )
    );

  }

      ,shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))));
}