import 'package:eplayer_flutter_mobile/colors/color.dart';
import 'package:eplayer_flutter_mobile/drawables/svgs.dart';
import 'package:eplayer_flutter_mobile/widgets/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../book_match/book_home.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  List<IconData> _randomIcons = [
    Icons.home,

    Icons.settings,
  ]; // List of random icons you want to display

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EplayerHomeAppBar("welcome"),
        body: Column(
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Hi, Bob",
                          style: GoogleFonts.quicksand(
                              color: app_purple_deep,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Text(
                          "Active",
                          style: GoogleFonts.quicksand(
                              color: Colors.green.shade500,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("Fund wallet",
                        style: GoogleFonts.quicksand(
                            color: app_purple_deep,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(addfundic),
                    SizedBox(
                      width: 15,
                    )
                  ],
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 22, right: 22),
                child: Container(
                  height: 140,
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
                                "My Account Earnings",
                                style: GoogleFonts.mulish(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "\$1,000,000",
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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Wins and Losses",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text("View All",
                      style: TextStyle(
                          color: app_purple, fontWeight: FontWeight.bold))
                ],
              ),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                  itemCount: 40,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 18.0, right: 22, bottom: 22),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Rev~Father",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Text("\$300",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(
                BookHome()
            );
            // Add the action you want the floating button to perform
          },
          child: Icon(Icons.gamepad_outlined,color: app_purple_deep,),
          backgroundColor: etbg, // Change the background color if needed
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        bottomNavigationBar: BottomNavigationBar(
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
        ));
  }
}
