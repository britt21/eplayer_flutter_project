import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> handleMessage(RemoteMessage message) async {
  print("Title: ${message.notification?.title}");
  print("body: ${message.notification?.body}");
  print("Payload: ${message.data}");
}
class FirebaseApi{


  final _firebaseMessaging= FirebaseMessaging.instance;
  Future<void> initNotify() async{
    await _firebaseMessaging.requestPermission();
    final fcmtoken = await _firebaseMessaging.getToken();
    print("Token: ${fcmtoken}");
    
    FirebaseMessaging.onBackgroundMessage(handleMessage);

  }


}