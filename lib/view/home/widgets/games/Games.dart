import 'package:eplayer_flutter_mobile/colors/color.dart';
import 'package:eplayer_flutter_mobile/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import 'book_match.dart';

class HomeGames extends StatelessWidget {
  final text;
  final images;
  HomeGames({required this.text, this.images});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black,
            image: DecorationImage(
              image: AssetImage(images), // Use AssetImage instead of SvgPicture.asset if it's an SVG
              fit: BoxFit.cover, // You can adjust this property as needed
            ),
          ),
          height: 200,
          width: 200,
          child: Padding(
            padding: const EdgeInsets.only(top: 18.0, left: 20),
            child: Stack(
              children: [
                Text(
                  "${text}",
                  style: GoogleFonts.mulish(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                   Padding(
                     padding: const EdgeInsets.only(bottom: 8.0),
                     child: Align(alignment: Alignment.bottomRight,
                         child: Container(
                           width: 170,
                             child: GameButton(Colors.white,Colors.white,"Proceed",Colors.black,(){
                               Get.to(BookMatch());
                             }))),
                   ),



              ],
            ),
          ),
        )

    );
  }
}
