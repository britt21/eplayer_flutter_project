import 'package:eplayer_flutter_mobile/drawables/pngs.dart';
import 'package:eplayer_flutter_mobile/view/home/widgets/games/Games.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/Utils.dart';



class DashBoardHome extends StatefulWidget {
  const DashBoardHome({super.key});

  @override
  State<DashBoardHome> createState() => _DashBoardHomeState();
}

class _DashBoardHomeState extends State<DashBoardHome> {
  final List post = [
    "Head to Head",
    "Team Tournament",
    "1v1 sniper",
    "post 4",
    "post 5",
    "post 6",
  ];

  final List images = [
    boxman,
    femaleboxer,
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: EplayerAppBar("Book a match"),
      body: ListView.builder(itemCount: post.length,itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: HomeGames(text: post[index],images: images[1],),
            );

          }
  ),
    );
  }
}

