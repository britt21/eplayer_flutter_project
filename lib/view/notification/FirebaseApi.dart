import 'package:eplayer_flutter_mobile/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../login/Login_home.dart';
import '../widget/bottom_sheet.dart';

Future<void> handleMessage(RemoteMessage message) async {
  print("Title: ${message.notification?.title}");
  print("Body: ${message.notification?.body}");
  print("Payload: ${message.data}");

  if(message.data.isNotEmpty){

  }
}


// ev8tdxu0QciOOy6tM5ZNaY:APA91bEPuiiaxoqNFwBiD-Bqzkmu4HQYhh9C9ySDhJlyN-O-qp3Up4Gf3OE9u-UYnIrhmrS8TEu1cNzdlsDQ8Qh5Qsr7bRPeaXVBoeVlh8keNNmVDmtHBgDeae7_i6o5TeOYxUsCERr1

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotify() async {
    await FirebaseMessaging.instance.subscribeToTopic("foo-bar");
    await _firebaseMessaging.requestPermission();
    final fcmtoken = await _firebaseMessaging.getToken();
    print("Token: ${fcmtoken}");

    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   handleMessage(message);
    //
    // });
  }
}
