import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../login/Login_home.dart';

Future<void> handleMessage(RemoteMessage message) async {
  print("Title: ${message.notification?.title}");
  print("Body: ${message.notification?.body}");
  print("Payload: ${message.data}");
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotify() async {
    await FirebaseMessaging.instance.subscribeToTopic("foo-bar");
    await _firebaseMessaging.requestPermission();
    final fcmtoken = await _firebaseMessaging.getToken();
    print("Token: ${fcmtoken}");

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      handleMessage(message);
    });
  }
}
