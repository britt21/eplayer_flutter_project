import 'package:flutter/material.dart';
import 'package:eplayer_flutter_mobile/colors/color.dart';
import 'package:eplayer_flutter_mobile/drawables/pngs.dart';
import 'package:eplayer_flutter_mobile/drawables/svgs.dart';
import 'package:eplayer_flutter_mobile/font/font.dart';
import 'package:eplayer_flutter_mobile/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 15, right: 15),
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                    "Connect with\nplayers.\n",
                    style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "eplayer mobile",
                        style: GoogleFonts.mulish(
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(bodycrvone),
              ],
            ),
            Padding( 
              padding: const EdgeInsets.only(top: 1.0),
              child: Image.asset(maprig),
            ),
          ],
        ),
      ],
    );
  }
}

class OnboardingPageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 15, right: 15),
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                    "Earn while\nyou play\n",
                    style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    "eplayer mobile",
                    style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(bodycrvone),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 1.0),
              child: Image.asset(maprig),
            ),
          ],
        ),
      ],
    );
  }
}