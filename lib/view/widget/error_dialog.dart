

import 'package:eplayer_flutter_mobile/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

void showmessage(message){
  Get.snackbar(
  icon: Icon(Icons.info_outlined),
    "Error",
    "${message}",
    backgroundColor: app_purple_deep,
    colorText: Colors.white,
  );

}