import 'package:eplayer_flutter_mobile/colors/color.dart';
import 'package:eplayer_flutter_mobile/drawables/svgs.dart';
import 'package:eplayer_flutter_mobile/font/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingOne extends StatelessWidget {
  const OnBoardingOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: app_purple,

      body: SafeArea(child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text("Earn while\nyou play",style: GoogleFonts.mulish(fontWeight: FontWeight.w900,color: Colors.white,fontSize: 30),),
                Stack(children:[ SvgPicture.asset(bodycrvone)])
            ]
            
            
          )
      )
]
      ),
      )
    );



  }

}
