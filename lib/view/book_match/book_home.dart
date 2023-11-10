
import 'package:eplayer_flutter_mobile/widgets/Utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../widgets/app_button.dart';
import 'find_match.dart';


class BookHome extends StatelessWidget {
  const BookHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EplayerAppBar("Book Match"),
        body: Padding(
          padding: const EdgeInsets.only(top: 25.0,left: 15,right: 15),
          child: Column(

            children: [
              EplayerEditText(toptitle: "Bidding Amount",ethint: "Enter amount",),
              SizedBox(height: 15,),
              AppButton("Find Match", () {
                Get.to(() => FindMatch());

              })

            ],
          ),
        ),

    );
  }
}
