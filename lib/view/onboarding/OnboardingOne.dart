
import 'package:eplayer_flutter_mobile/colors/color.dart';
import 'package:eplayer_flutter_mobile/drawables/pngs.dart';
import 'package:eplayer_flutter_mobile/drawables/svgs.dart';
import 'package:eplayer_flutter_mobile/font/font.dart';
import 'package:eplayer_flutter_mobile/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingOne extends StatelessWidget {
  const OnBoardingOne({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = PageController();
    return Scaffold(
      backgroundColor: app_purple,

      body: SafeArea(child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Column(
                      children: [

                        Text("Connect with players\nacross the world\n",style: GoogleFonts.mulish(fontWeight: FontWeight.w900,color: Colors.white,fontSize: 30),),
                        Text("Eplayer Mobile",style: GoogleFonts.mulish(fontWeight: FontWeight.w900,color: Colors.white,fontSize: 30),),

                      ],
                    ),
                  ],
                ),
              ),
              Stack(alignment: AlignmentDirectional.topCenter,
                  children:[
                Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(bodycrvone),

                ],
              ),

                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Image.asset(maprig),
                )

              ]


          )
            ]
      ),
          Expanded(child: Container(),),
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: SmoothPageIndicator(

              controller: controller,
              count: 2, // Replace with the actual number of pages
             effect: ExpandingDotsEffect(
               activeDotColor: lit_purple,dotColor: Colors.white,
             ),
            ),
          ),


          Align(alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: AppButton(lit_purple, btn_color, "Continue", app_purple, null,(){}),
              ))
      ]
      )
      )
    );



  }

}
