
import 'package:eplayer_flutter_mobile/view/book_match/service/model/request/book_match_request.dart';
import 'package:eplayer_flutter_mobile/view/widget/error_dialog.dart';
import 'package:eplayer_flutter_mobile/widgets/Utils.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../colors/color.dart';
import '../../drawables/pngs.dart';
import '../../font/font.dart';
import '../../font/fonts.dart';
import '../../widgets/app_button.dart';
import '../widget/bottom_sheet.dart';
import 'controller/book_match_controller.dart';
import 'find_match.dart';


class BookHome extends StatefulWidget {
  const BookHome({super.key});

  @override
  State<BookHome> createState() => _BookHomeState();
}

class _BookHomeState extends State<BookHome> {

   TextEditingController amountController = TextEditingController();


  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {

    amountController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: EplayerAppBar("Book Match"),
        body: Padding(
          padding: const EdgeInsets.only(top: 25.0,left: 15,right: 15),
          child: Column(

            children: [
              EplayerEditTextNumber(toptitle: "Bidding Amount",ethint: "Enter amount",etcontroller: amountController,),
              SizedBox(height: 15,),
              AppButton("Find Match", () {



                if (validateAmount(amountController)) {
                  int? amount = int.tryParse(amountController.text);

                  // Get.to(() => FindMatch(amount: amount ?? 0));

                  gamebotomsheet(context,false,"Rev~father",2000,(){});
                  // Do the rest of your logic here
                }




              })

            ],
          ),
        ),

    );
  }

}


bool validateAmount(TextEditingController amountController) {
  String amountText = amountController.text;

  if (amountText.isEmpty) {
    showmessage("Amount must not be empty");
    return false;
  } else if (int.tryParse(amountText) != null && int.parse(amountText) < 100) {
    showmessage("Amount must not be less than 100");
    return false;
  } else {
    // Handle other cases if needed
    return true; // If no validation error, return true
  }
}



