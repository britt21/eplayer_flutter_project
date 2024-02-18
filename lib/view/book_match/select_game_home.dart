
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:eplayer_flutter_mobile/view/book_match/service/book_match_service.dart';
import 'package:eplayer_flutter_mobile/view/book_match/service/model/response/all_games/AllGamesResponse.dart';
import 'package:eplayer_flutter_mobile/widgets/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../colors/color.dart';
import '../../drawables/svgs.dart';
import '../../widgets/app_button.dart';
import '../widget/error_dialog.dart';
import 'find_match.dart';


class SelectGameHome extends StatefulWidget {
  const SelectGameHome({super.key});


  @override
  State<SelectGameHome> createState() => _SelectGameHomeState();
}

class _SelectGameHomeState extends State<SelectGameHome> {

  TextEditingController amountController = TextEditingController();

  var bookService = BookService();

  String? selecteditem;
  List<Body> projectitems = [];

  @override
  void initState() {
    getAllGames();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Obx( ()=> BlurryModalProgressHUD(
      inAsyncCall: bookService.isLoading.value,child: Scaffold(
        appBar: EplayerHomeAppBar("Select Game"),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Select Game",style: GoogleFonts.mulish(
                      color: app_purple_deep,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 2, color: app_purple_deep),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            dropdownColor: app_purple_deep,
                            // Set dropdown view color to transparent


                            hint: Text(
                              "Select a game",
                              style: TextStyle(color: Colors.black),
                            ),
                            value: selecteditem,
                            icon: SvgPicture.asset(downarrow),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            onChanged: (dvalue) {
                              setState(() {

                                selecteditem = dvalue;
                              });
                            },
                            items: projectitems.map((menuItem) {
                              return DropdownMenuItem<String>(
                                value: menuItem.gameName,
                                child: Row(
                                  children: [
                                    Container(
                                      // Set background color to transparent
                                      child: Text(
                                        menuItem.gameName!,
                                        style: TextStyle(color: lit_purple),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: AppButtonWide("Find Match", () async {

                    if (validateGame()) {
                      print("${selecteditem}");
                      // bookMatch(amount);
                    }

                  }),
                )

              ],
            ),
          ),
        ),

      )
      )
      );
  }




  Future<void> bookMatch(amount) async {

    var userinfo = GetStorage();
    var userId = userinfo.read("userid");
    var response =   await bookService.bookMatch(userId, amount, "Call of Duty Mobile");

    if(response.responseCode ==  200){
      var userName = GetStorage().read('nickName');

      Get.to(() => FindMatch(gameid: response.body!.gameid!,amount: amount!,userID: userId,userName: userName,gameName: "Call of Duty Mobile",));
      bookService.isLoading(false);

    }else{
      print("DMESSAGEIGOT: ${response.message}");
      bookService.isLoading(false);
      showmessage(response.message);
    }
  }




  Future<void> getAllGames() async {

    var userinfo = GetStorage();
    var userId = userinfo.read("userid");
    var response =   await bookService.getAllGames();

    if(response.responseCode ==  200){
      var userName = GetStorage().read('nickName');

      projectitems = response.body!;
      bookService.isLoading(false);


    }else{
      print("DMESSAGEIGOT: ${response.message}");
      bookService.isLoading(false);
      showmessage(response.message);
    }
  }

  bool validateGame() {
    if(selecteditem ==  null){
      showmessage("Select a game first");
      return false;
    }
    return true;
  }



}
