import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../colors/color.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../colors/color.dart';
import '../../drawables/pngs.dart';
import '../../font/font.dart';
import '../../font/fonts.dart';
import '../../sound/sound.dart';
import '../../widgets/app_button.dart';
import 'package:audioplayers/audioplayers.dart';

final AudioPlayer audioPlayer = AudioPlayer();

Future gamebotomsheet(BuildContext context, bool dissmiss, name, amount,
    VoidCallback isaccepted) {
  playAudio();

  return showModalBottomSheet(
      isDismissible: false,
      backgroundColor: etbg,
      context: context,
      builder: (BuildContext context) {
        return Container(
            height: 320,
            child: Center(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                    child: Center(
                      child: Text(
                        "Call of duty mobile",
                        style: GoogleFonts.mulish(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(
                  thickness: 0.5,
                  color: lit_purple,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Player: ",
                        style: midfontblack,
                      ),
                      Text(
                        "${name}",
                        style: midfontblack,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Bid: ",
                        style: midfontblack,
                      ),
                      Text(
                        "${amount}",
                        style: midfontblack,
                      )
                    ],
                  ),
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
                  ],
                ),
                Divider(thickness: 0.5, color: lit_purple),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: AppButtonDeep("Dismiss", () {
                        stopAudio();
                      })),
                      // Navigator.pop(context);})),
                      Expanded(child: AppButton("More details", isaccepted)),
                    ],
                  ),
                ),
              ],
            )));
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))));
}

void stopAudio() {
  audioPlayer.stop();
}

Future<void> playAudio() async {

  await audioPlayer.play(AssetSource('meetsound.m4a'));



}
