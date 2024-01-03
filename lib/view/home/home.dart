import 'dart:convert';

import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:eplayer_flutter_mobile/colors/color.dart';
import 'package:eplayer_flutter_mobile/consts/constants.dart';
import 'package:eplayer_flutter_mobile/drawables/svgs.dart';
import 'package:eplayer_flutter_mobile/view/widget/error_dialog.dart';
import 'package:eplayer_flutter_mobile/widgets/Utils.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../book_match/book_home.dart';
import '../book_match/service/book_match_service.dart';
import '../notification/FirebaseApi.dart';
import '../widget/bottom_sheet.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final introdata = GetStorage();
  var bookService = BookService();


  @override
  void initState() {
    super.initState();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("GETTINGMESSAGEBODY ; ${message.notification?.body}");
      print("GETTINGMESSAGETITLE ; ${message.notification?.title}");
      print("GETTINGMESSAGETITLE ; ${message.data}");
      bool hasShown = false;


      // gamebotomsheet(context,false,"Emeka Dgreg",message.data["amount"],(){});


      var fromId = message.data['fromid'];
      var gameid = message.data['gameId'];
      var amount = message.data['amount'];

      var userId = GetStorage().read("userid");
      if(fromId != userId) {
        gamebotomsheet(context, false, message.data["name"],
            "₦${message.data["amount"]}", () {


                acceptMatch(gameid,amount);
                Navigator.pop(context);




            }).then((value) => hasShown = true);
        hasShown = true;

        print("ggg: ${hasShown}");

      }
    });

  }
  int _selectedIndex = 0;

  List<IconData> _randomIcons = [
    Icons.home,

    Icons.settings,

  ]; // List of random icons you want to display

  var name = GetStorage().read(nickname);
  var userbalance = GetStorage().read(balance);
  @override
  Widget build(BuildContext context) {

    return Obx(
       () => BlurryModalProgressHUD(inAsyncCall: bookService.isLoading.value,
      child: Scaffold(
        backgroundColor: etbglit,
          appBar: EplayerHomeAppnoback("welcome"),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hi, $name",
                              style: GoogleFonts.ptSans(

                                  color: app_purple_deep,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Text(
                              "Wallet",
                              style: GoogleFonts.quicksand(
                                  color: Colors.grey.shade500,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Fund wallet",
                            style: GoogleFonts.quicksand(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 25,
                            width: 20,
                            child: SvgPicture.asset(addfundic)),
                        SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 15.0, left: 22, right: 22),
                    child: Container(
                      height: 160,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: app_purple_deep.withOpacity(0.3),
                            // Adjust the opacity and color as needed
                            blurRadius: 3,
                            // Adjust the blur radius as needed
                            spreadRadius: 0,
                            // Adjust the spread radius as needed
                            offset:
                                Offset(0, 6), // Offset to create the shadow below
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: Container(

                              decoration: BoxDecoration(
                                color: app_purple_deep,
                                borderRadius: BorderRadius.circular(35),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "My Wallet",
                                    style: GoogleFonts.mulish(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "₦$userbalance",
                                      style: GoogleFonts.mulish(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 19,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 23.0, top: 1),
                            child: Container(
                              child: SvgPicture.asset(cardbgtop),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: SvgPicture.asset(cardbgbottom),
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [SvgPicture.asset(payout), Text("Topup")],
                    ),
                    Column(
                      children: [SvgPicture.asset(etgift), Text("Gift")],
                    ),
                    Column(
                      children: [SvgPicture.asset(payout), Text("Payout")],
                    ),
                  ],
                ),
                // Padding(
                //   padding: const EdgeInsets.all(20.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         "Wins and Losses",
                //         style: TextStyle(
                //             color: Colors.black, fontWeight: FontWeight.bold),
                //       ),
                //       Text("View All",
                //           style: TextStyle(
                //               color: app_purple, fontWeight: FontWeight.bold))
                //     ],
                //   ),
                // ),
                // Container(
                //   height: 150,
                //   child: ListView.builder(
                //       itemCount: 40,
                //       itemBuilder: (context, index) {
                //         return Padding(
                //           padding: const EdgeInsets.only(
                //               left: 18.0, right: 22, bottom: 22),
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Column(
                //                 children: [
                //                   Text(
                //                     "Rev~Father",
                //                     style: TextStyle(
                //                         color: Colors.black,
                //                         fontWeight: FontWeight.w500),
                //                   ),
                //                 ],
                //               ),
                //               Text("\$300",
                //                   style: TextStyle(
                //                       color: Colors.green,
                //                       fontWeight: FontWeight.bold))
                //             ],
                //           ),
                //         );
                //       }),
                // ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {




            Get.to(() => BookHome());
              // Add the action you want the floating button to perform
            },
            child: Icon(Icons.gamepad_outlined,color: app_purple_deep,),
            backgroundColor: etbg, // Change the background color if needed
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: etbglit,
            currentIndex: _selectedIndex,
            onTap: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: List.generate(_randomIcons.length, (index) {
              return BottomNavigationBarItem(
                icon: Icon(_randomIcons[index],color: app_purple,),
                label: '', // You can set the label if needed
              );
            }),
          )),
    )
    );
  }

  // void getMessages(){
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     handleMessage(message);
  //
  //
  //
  //   });

  // }


  Future<void> acceptMatch(gameId,amount) async {
    // var balance = GetStorage().read("balance");
    //
    // var dbal = int.parse(balance);
    // var damt = int.parse(amount);
    //
    //
    // print("BOTHBALANDAME: ${dbal}     $damt");
    //
    // if(balance < amount) {
    //   showmessage("Insufficient fund, Kindly Top up your wallet to accept this match");
    //   Navigator.pop(context);
    // }else{
    //
    // }

    bookService.isLoading(true);

    var userinfo = GetStorage();
    var userId = userinfo.read("userid");
    var nickName = userinfo.read("nickName");

    print("IGOTDGAMEID: ${gameId}");
    var response =   await bookService.acceptMatch(gameId, userId,nickName);

    if(response.responseCode ==  200){
      showmessage("Match accepted");
      bookService.isLoading(false);

    }else{
      print("DMESSAGEIGOT: ${response.message}");
      bookService.isLoading(false);
      showmessage(response.message);
    }
  }
}



