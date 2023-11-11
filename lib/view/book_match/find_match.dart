import 'package:eplayer_flutter_mobile/view/book_match/service/model/request/book_match_request.dart';
import 'package:eplayer_flutter_mobile/view/widget/bottom_sheet.dart';
import 'package:eplayer_flutter_mobile/widgets/Utils.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../font/fonts.dart';
import '../../drawables/pngs.dart';
import 'controller/book_match_controller.dart';

class FindMatch extends StatefulWidget {

  final int amount;

  FindMatch({required this.amount});


  @override
  State<FindMatch> createState() => _FindMatchState();
}

class _FindMatchState extends State<FindMatch>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  var notificationController = NotificationController();

  bool _isExpanded = false; // To track the state of the animation

  late Map payload;
  @override
  void initState() {

    super.initState();



    getResponse(widget.amount);

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
  Future<void> getResponse(int matchAmount) async {
    final request = NotificationRequest(
      to: '/topics/foo-bar',
      notification: {
        'title': 'New Match',
        'body': '1 v 1 sniper',
      },
      data: {
        'amount': '${matchAmount}',
        'fromid': '1234',
        'name': 'xmas_bunny',
        'rank': '5 star',
      },
    );
    // Get.to(() => FindMatch());

    notificationController.sendNotification(request);

    final response = await notificationController.sendNotification(request);

    if (response != null) {
      // Handle the response
      print('Notification sent successfully. Message ID: ${response.messageId}');
    } else {
      // Handle the error
      print('Failed to send notification.');
    }
  }

}




