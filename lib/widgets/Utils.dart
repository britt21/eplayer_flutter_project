import 'package:eplayer_flutter_mobile/drawables/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/color.dart';


class EplayerAppBar extends StatelessWidget implements PreferredSizeWidget{

  final title;

  EplayerAppBar(this.title);

  @override
  Widget build(BuildContext context) {


    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.5,
      leading: GestureDetector(onTap: (){Navigator.pop(context);},child: SvgPicture.asset(etback)),
      title: Text("${title}",style: GoogleFonts.mulish(color: app_purple,fontWeight: FontWeight.bold,fontSize: 25),),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
