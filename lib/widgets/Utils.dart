import 'package:eplayer_flutter_mobile/drawables/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/color.dart';


class EplayerAppBar extends StatelessWidget implements PreferredSizeWidget{

  final title;

  EplayerAppBar(this.title);

  @override
  Widget build(BuildContext context) {


    return Stack(
      children:[

        AppBar(
        backgroundColor: Colors.white,
        elevation: 1,centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              width: 24,
              height: 24,
              child: SvgPicture.asset(etback),
            ),
          ),
        ),
        title: Text("${title}",style: GoogleFonts.mulish(color: app_purple,fontWeight: FontWeight.bold,fontSize: 20),),
      ),
    ]
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
