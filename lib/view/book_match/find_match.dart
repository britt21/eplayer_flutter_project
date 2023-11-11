import 'package:eplayer_flutter_mobile/view/widget/bottom_sheet.dart';
import 'package:eplayer_flutter_mobile/widgets/Utils.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../font/fonts.dart';
import '../../drawables/pngs.dart';

class FindMatch extends StatefulWidget {
  @override
  State<FindMatch> createState() => _FindMatchState();
}

class _FindMatchState extends State<FindMatch>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isExpanded = false; // To track the state of the animation

  late Map payload;
  @override
  void initState() {

    super.initState();


    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("GETTINGMESSAGEBODY ; ${message.notification?.body}");
      print("GETTINGMESSAGETITLE ; ${message.notification?.title}");
      print("GETTINGMESSAGETITLE ; ${message.data}");
      payload= message.data;

      bool hasShown = false;

      print("HUNGRYPAYLOAD ${payload}");

      if(message.data.isNotEmpty && message.data["fromid"] == "1234"){
        if(hasShown== true) {

        }else{
          gamebotomsheet(context, false, message.data["name"],
              "\$${message.data["amount"]}", () {hasShown = false;}).then((value) => hasShown = true);

          hasShown = true;
        }

        print("ggg: ${hasShown}");

      }

    });

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true); // Animates the controller in a loop

    _controller.addListener(() {
      setState(() {

        _isExpanded = _controller.status == AnimationStatus.forward;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    print("GETTINGDISPOSED");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EplayerHomeAppnoback(""),
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Finding you a match",style: bigfontbig),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(seconds: 3),
                    curve: Curves.easeInOut,
                    width: _isExpanded ? 200.0 : 100.0,
                    // Adjust width based on state
                    height: _isExpanded ? 200.0 : 100.0,
                    // Adjust height based on state
                    child: Image.asset(matchbg),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
