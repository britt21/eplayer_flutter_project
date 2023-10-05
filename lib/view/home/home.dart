import 'package:eplayer_flutter_mobile/colors/color.dart';
import 'package:eplayer_flutter_mobile/drawables/svgs.dart';
import 'package:eplayer_flutter_mobile/widgets/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


class Home extends StatefulWidget {

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EplayerHomeAppBar("welcome"),
      body: Column(
        children: [
          SizedBox(height: 15,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Row(
                children: [
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Hi, Bob",style: GoogleFonts.quicksand(color: app_purple_deep,fontWeight: FontWeight.bold,fontSize: 20),),
                      Text("Active",style: GoogleFonts.quicksand(color: Colors.green.shade500,fontWeight: FontWeight.bold,fontSize: 18),),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Text("Fund wallet",style: GoogleFonts.quicksand(color: app_purple_deep,fontWeight: FontWeight.bold)),
                  SizedBox(width: 10,),
                  SvgPicture.asset(addfundic),
                  SizedBox(width: 15,)
                ],
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(top: 15.0,left: 25),
            child:Container(
              height: 150,
              child: Stack(
                children: [
                  SvgPicture.asset(walletbg),
                  Center(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "My Account Earnings",
                            style: GoogleFonts.mulish(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "\$1,000,000",
                              style: GoogleFonts.mulish(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 19,),
                            ),
                          ),
                          SizedBox(height: 20,)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(children: [
                SvgPicture.asset(payout),
                Text("Payout")],),
              Column(children: [
                SvgPicture.asset(etgift),

                Text("Gift")],),
              Column(children: [
                SvgPicture.asset(payout),
                Text("Payout")],),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Wins and Losses",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                Text("View All",style: TextStyle(color: app_purple,fontWeight: FontWeight.bold))
              ],
            ),
          ),

          Container(
            height: 200,
            child: ListView.builder(itemCount: 40,
                itemBuilder: (context,index){
              return  Padding(
                padding: const EdgeInsets.only(left: 18.0,right: 18,bottom: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text("Rev~Father",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),

                      ],
                    ),
                    Text("\$300",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold))
                  ],
                ),
              );
            }),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 40.0,left: 16,right: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(30)
              ),
              child: BottomNavigationBar(
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.grey,
                showSelectedLabels: true,
                showUnselectedLabels: false,
                backgroundColor: app_purple_deep,
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
                  BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
                  BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
