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

  AppButton(this.borderColor, this.backGroundColor, this.text, this.textColor,
      this.icon, this.touch);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
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
class GameButton extends StatelessWidget {
  final borderColor;
  final backGroundColor;
  final text;
  final textColor;
  final VoidCallback touch;

  GameButton(this.borderColor, this.backGroundColor, this.text, this.textColor, this.touch);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: InkWell(
          onTap: touch,
          child: Container(
            decoration: BoxDecoration(
              color: backGroundColor,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 3, color: borderColor),
            ),
            child: Center(
              child: Text(
                text,
                style: GoogleFonts.aBeeZee(
                  color: textColor,
                  fontSize: 18,
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

  AppButtonFit(this.borderColor, this.backGroundColor, this.text,
      this.textColor, this.icon, this.touch);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
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

class AppEditText extends StatefulWidget {

   final  etcontroller;
   final  ethint;

   AppEditText({this.etcontroller, this.ethint});


  @override
  State<AppEditText> createState() => _AppEditTextState();
}

class _AppEditTextState extends State<AppEditText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
          decoration: BoxDecoration(
              color: etbg,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(6), topLeft: Radius.circular(6))),
          height: 50,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: TextField(
              controller: widget.etcontroller,
              decoration: InputDecoration(
                hintText: widget.ethint,
              ),
            ),
          )),
    );
  }
}




class EtPass extends StatelessWidget {
  final TextEditingController etcontroller;

  EtPass({required this.etcontroller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: etbg,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(6),
            topLeft: Radius.circular(6),
          ),
        ),
        height: 50,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: TextField(
            style: GoogleFonts.mulish(color: Colors.black,fontWeight: FontWeight.bold),
            controller: etcontroller,
            obscureText: true, // This makes it a password input field
            decoration: InputDecoration(suffixStyle: GoogleFonts.mulish(color: Colors.black,fontWeight: FontWeight.bold),
              hintText: "Password",
            ),
          ),
        ),
      ),
    );
  }
}
class AppTextView extends StatelessWidget {

  AppTextView();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: etbg,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(6),
            topLeft: Radius.circular(6),
          ),
        ),
        height: 50,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: TextField(
            style: GoogleFonts.mulish(color: Colors.black,fontWeight: FontWeight.bold),
            obscureText: true, // This makes it a password input field
            decoration: InputDecoration(suffixStyle: GoogleFonts.mulish(color: Colors.black,fontWeight: FontWeight.bold),
              hintText: "Password",
            ),
          ),
        ),
      ),
    );
  }
}
