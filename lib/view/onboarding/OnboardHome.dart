import 'package:eplayer_flutter_mobile/colors/color.dart';
import 'package:eplayer_flutter_mobile/drawables/pngs.dart';
import 'package:eplayer_flutter_mobile/drawables/svgs.dart';
import 'package:eplayer_flutter_mobile/font/font.dart';
import 'package:eplayer_flutter_mobile/view/login/Login_home.dart';
import 'package:eplayer_flutter_mobile/view/signup/Select_country.dart';
import 'package:eplayer_flutter_mobile/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../signup/Signup_home.dart';
import 'onboardIngTwo.dart';

class OnBoardHome extends StatefulWidget {
  @override
  State<OnBoardHome> createState() => _OnBoardHomeState();
}

class _OnBoardHomeState extends State<OnBoardHome> {
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    var pageController = PageController();

    return Scaffold(
      backgroundColor: app_purple,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                onPageChanged: (value) {
                  setState(() {
                    print("dval ${value}");
                    isLastPage = (value == 1);
                  });
                },
                controller: pageController,
                children: [
                  OnboardingPageOne(),
                  OnboardingPageTwo(),
                  // Add more pages here
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: SmoothPageIndicator(
                controller: pageController,
                count: 2, // Replace with the actual number of pages
                effect: ExpandingDotsEffect(
                  activeDotColor: lit_purple,
                  dotColor: Colors.white,
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: isLastPage
                    ? Row(
                      children: [
                        Expanded(
                          child: Padding(
                              padding: const EdgeInsets.only(bottom: 45.0),
                              child: AppButton(
                                  lit_purple, app_purple_deep, "Join Eplayer", lit_purple, null,
                                  () {
                                    Get.to(SignUpHome());

                              }),
                            ),
                        ),
                           Expanded(
                             child: Padding(
                              padding:  EdgeInsets.only(bottom: 45.0),
                              child: AppButton(
                                  lit_purple, btn_color, "Login", app_purple_deep, null,
                                  () {
                                    Get.to(LoginHome());


                                  }),
                          ),
                           ),


                      ],
                    )

                    : Padding(
                        padding: const EdgeInsets.only(bottom: 45.0),
                        child: AppButton(
                            lit_purple, btn_color, "Continue", app_purple, null,
                            () {
                          pageController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.slowMiddle);
                          print("CURRPAGE ${pageController.page} ");
                        }),
                      )),
          ],
        ),
      ),
    );
  }
}

