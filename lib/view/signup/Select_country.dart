import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:eplayer_flutter_mobile/colors/color.dart';
import 'package:eplayer_flutter_mobile/widgets/Utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SelectCountry extends StatefulWidget {
  const SelectCountry({Key? key}) : super(key: key);

  @override
  _SelectCountryState createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  String valueChose = "one";
  List list = ["Books", "Bag", "Clothes","Shoes"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EplayerAppBar("Signup"),
      body: SingleChildScrollView(child: Column(children: [


      ],),)
    );
  }
}
