import 'dart:ffi';

import 'package:eplayer_flutter_mobile/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AppButton extends StatelessWidget {
  final borderColor;
  final backGroundColor;
  final text;
  final textColor;
  final icon;
  final VoidCallback touch;

  AppButton(this.borderColor, this.backGroundColor, this.text, this.textColor,this.icon,this.touch);


  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 55,
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: InkWell(
          onTap: touch,
          child: Container(
            decoration: BoxDecoration(
              color: backGroundColor,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 3, color: lit_purple),
            ),
            child: Center(
              child: Text(
                text,
                style: GoogleFonts.mulish(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}



class AppButtonFit extends StatelessWidget {
  final borderColor;
  final backGroundColor;
  final text;
  final textColor;
  final icon;
  final VoidCallback touch;

  AppButtonFit(this.borderColor, this.backGroundColor, this.text, this.textColor,this.icon,this.touch);


  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 55,
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: InkWell(
          onTap: touch,
          child: Container(
            decoration: BoxDecoration(
              color: backGroundColor,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 3, color: lit_purple),
            ),
            child: Center(
              child: Text(
                text,
                style: GoogleFonts.mulish(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


