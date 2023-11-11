
import 'package:eplayer_flutter_mobile/drawables/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors/color.dart';
import '../font/fonts.dart';


class EplayerHomeAppnoback extends StatelessWidget implements PreferredSizeWidget{

  final title;

  EplayerHomeAppnoback(this.title);

  @override
  Widget build(BuildContext context) {


    return AppBar(
    backgroundColor: Colors.white,
    elevation: 1,centerTitle: true,
    leading: Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        width: 24,
        height: 24,
      ),
    ),
    title: Text("${title}",style: bigfont),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 18.0),
          child: Container(child: Icon(Icons.info_outlined,color: app_purple_deep,)),
        )
      ],
      );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);


}
class EplayerHomeAppBar extends StatelessWidget implements PreferredSizeWidget{

  final title;

  EplayerHomeAppBar(this.title);

  @override
  Widget build(BuildContext context) {


    return AppBar(
    backgroundColor: Colors.white,
    elevation: 1,centerTitle: true,
    leading: Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        width: 24,
        height: 24,
        child: SvgPicture.asset(etback),
      ),
    ),
    title: Text("${title}",style: GoogleFonts.mulish(color: app_purple,fontWeight: FontWeight.w900,fontSize: 20),),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 18.0),
          child: Container(child: Icon(Icons.info_outlined,color: app_purple_deep,)),
        )
      ],
      );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);


}
class EplayerAppBar extends StatelessWidget implements PreferredSizeWidget{

  final title;

  EplayerAppBar(this.title);

  @override
  Widget build(BuildContext context) {


    return AppBar(
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
    title: Text("${title}",style: GoogleFonts.mulish(color: app_purple,fontWeight: FontWeight.w900,fontSize: 20),),
      );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);


}


class EditText extends StatelessWidget {
  const EditText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.purple),
      height: 55,
        child: TextField());
  }
}

class Spinner extends StatefulWidget {
  const Spinner({super.key});

  @override
  State<Spinner> createState() => _SpinnerState();
}

class _SpinnerState extends State<Spinner> {
  var valueChose = "";
  var list =  ["Books","Bag","Clothes"];

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: valueChose,
      items: list.map((eachitem){
        return DropdownMenuItem(
          value: eachitem,
          child: Text(eachitem),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          valueChose = newValue ?? "";
        });
      },
    );
  }
}
