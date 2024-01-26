import 'dart:async';

import 'package:eplayer_flutter_mobile/view/book_match/service/book_match_service.dart';
import 'package:eplayer_flutter_mobile/view/book_match/service/model/request/book_match_request.dart';
import 'package:eplayer_flutter_mobile/view/widget/bottom_sheet.dart';
import 'package:eplayer_flutter_mobile/view/widget/error_dialog.dart';
import 'package:eplayer_flutter_mobile/widgets/Utils.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../font/fonts.dart';
import '../../drawables/pngs.dart';
import 'controller/book_match_controller.dart';

class FindMatch extends StatefulWidget {
  final String gameid;
  final int amount;
  final String userID;
  final String userName;
  final String gameName;

  FindMatch({required this.amount, required this.userID, required this.userName, required this.gameName, required this.gameid,});

  @override
  State<FindMatch> createState() => _FindMatchState();
}

class _FindMatchState extends State<FindMatch> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  var notificationController = NotificationController();
  BookService bookService = BookService();
  bool _isExpanded = false; // To track the state of the animation
  late Map payload;
  late Timer _timer;


  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      // Call your API here
      getBookedGame();
    });

    getResponse(widget.amount,widget.userID,widget.userName,"Call of Duty Mobile",widget.gameid);

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
    _timer.cancel();
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
          Text("Finding you a match", style: bigfontbig),
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

  Future<void> getResponse(int matchAmount,String userId,String userName,String gameName,String gameId,) async {
    print("SENDINGNOFIFY");

    final request = NotificationRequest(
      to: '/topics/foo-bar',
      notification: {
        'title': 'New Match',
        'body': '1 v 1 sniper',
      },
      data: {
        'amount': '${matchAmount}',
        'fromid': '${userId}',
        'name': '${userName}',
        'gameName': '${gameName}',
        'gameId': '${gameId}',
      },
    );



    final response = await notificationController.sendNotification(request);

    if (response != null) {
      // Handle the response
      print('Notification sent successfully. Message ID: ${response.messageId}');
    } else {
      // Handle the error
      Navigator.pop(context);
      showmessage("Failed to send notification, your network might be too slow");
      print('Failed to send notification.');
    }
  }


  void getBookedGame() async{
    print("TRIFFERED");
    var response = await bookService.getBookedGames(widget.gameid);
    if(response.responseCode == 200){
      if(response.body?.takenById != ""){
        Navigator.pop(context);
        showmessage("Matched Found");
      }
    }else{
      showmessage("${response.message}");
    }
  }
}





