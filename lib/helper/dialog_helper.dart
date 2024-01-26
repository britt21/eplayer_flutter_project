

import 'package:eplayer_flutter_mobile/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DialogHelper{


 static void showErrorDialog({String title = "error", String description = "Something went Wrong"}){

    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

            Text("${title}",style: TextStyle(color: Colors.black,fontSize: 13),),
            Text("${description}",style: TextStyle(color: Colors.black,fontSize: 15),),
            SizedBox(height: 30,),
            Container(
              child: AppButton("Ok",(){
                if(Get.isDialogOpen!) Get.back();
              })
            ),
              SizedBox(height: 10,),


            ],
          ),
        ),
      )
    );
  }

}