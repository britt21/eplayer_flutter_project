import 'dart:ffi';

import 'package:eplayer_flutter_mobile/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButton extends StatelessWidget {
  final text;
  final VoidCallback touch;

  AppButton( this.text, this.touch);


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
              color: app_purple,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 3, color: lit_purple),
            ),
            child: Center(
              child: Text(
                text,
                style: GoogleFonts.mulish(
                  color: Colors.white,
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
class AppButtonLit extends StatelessWidget {
  final text;
  final textColor;
  final icon;
  final VoidCallback touch;

  AppButtonLit( this.text, this.textColor,
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
              color: btn_color,
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
class AppButtonDeep extends StatelessWidget {
  final text;
  final VoidCallback touch;

  AppButtonDeep( this.text, this.touch);


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
              color: app_purple_deep,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 3, color: lit_purple),
            ),
            child: Center(
              child: Text(
                text,
                style: GoogleFonts.mulish(
                  color: lit_purple,
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



class AppButtonPurple extends StatelessWidget {
  final text;
  final VoidCallback touch;

AppButtonPurple(this.text,
      this.touch);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: Padding(
        padding: const EdgeInsets.only(left: 00, right: 00),
        child: InkWell(
          onTap: touch,
          child: Container(
            decoration: BoxDecoration(
              color: app_purple,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 3, color: lit_purple),
            ),
            child: Center(
              child: Text(
                text,
                style: GoogleFonts.mulish(
                  color: Colors.white,
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

  GameButton(this.borderColor, this.backGroundColor, this.text, this.textColor,
      this.touch);

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
  final etcontroller;
  final ethint;

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
          child: TextField(
            controller: widget.etcontroller,
            style: TextStyle(fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 10.0),
              hintText: widget.ethint,
            ),
          )),
    );
  }
}

class EplayerEditText extends StatefulWidget {
  final etcontroller;
  final ethint;
  final toptitle;

  EplayerEditText({this.etcontroller, this.ethint, this.toptitle});

  @override
  State<EplayerEditText> createState() => _EplayerEditTextState();
}

class _EplayerEditTextState extends State<EplayerEditText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [

          Row(
            children: [
              Text("${widget.toptitle}",style: GoogleFonts.mulish(
                color: app_purple_deep,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),),
            ],
          ),
          Container(
              decoration: BoxDecoration(
                  color: etbg,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(6), topLeft: Radius.circular(6))),
              height: 50,
              child: TextField(
                controller: widget.etcontroller,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10.0), // Adjust the padding here
                  hintText: widget.ethint,
                ),
              )),
        ],
      ),
    );
  }
}

class EplayerEditTextNumber extends StatefulWidget {
  final etcontroller;
  final ethint;
  final toptitle;

  EplayerEditTextNumber({this.etcontroller, this.ethint, this.toptitle});

  @override
  State<EplayerEditTextNumber> createState() => _EplayerEditTextNumberState();
}

class _EplayerEditTextNumberState extends State<EplayerEditTextNumber> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [

          Row(
            children: [
              Text("${widget.toptitle}",style: GoogleFonts.mulish(
                color: app_purple_deep,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),),
            ],
          ),
          Container(
              decoration: BoxDecoration(
                  color: etbg,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(6), topLeft: Radius.circular(6))),
              height: 50,
              child: TextField(
                controller: widget.etcontroller,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10.0), // Adjust the padding here

                  hintText: widget.ethint,
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],

              )),
        ],
      ),
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
        child: TextField(
          style: GoogleFonts.mulish(
            color: Colors.black,
            fontWeight: FontWeight.bold,

          ),
          controller: etcontroller,
          obscureText: true, // This makes it a password input field
          maxLength: 4, // Set the maximum length to 4
          keyboardType: TextInputType.number, // Use the number keyboard
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly, // Allow only numeric input
          ],
          decoration: InputDecoration(
            suffixStyle: GoogleFonts.mulish(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            contentPadding: EdgeInsets.only(left: 10.0), // Adjust the padding here
            hintText: "Password",
            counterText: "", // Remove the default character count
          ),
        ),
      ),
    );
  }
}
class AppTextView extends StatelessWidget {
  final edittexthint;

  AppTextView(this.edittexthint);

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
        child: TextField(
          style: GoogleFonts.mulish(
              color: Colors.black, fontWeight: FontWeight.bold),
          obscureText: true, // This makes it a password input field
          decoration: InputDecoration(
            suffixStyle: GoogleFonts.mulish(
                color: Colors.black, fontWeight: FontWeight.bold),
            hintText: "${edittexthint}",
            contentPadding: EdgeInsets.only(left: 10.0), // Adjust the padding here

          ),
        ),
      ),
    );
  }
}
