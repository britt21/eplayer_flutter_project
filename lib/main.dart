import 'package:dash_bubble/dash_bubble.dart';
import 'package:eplayer_flutter_mobile/view/notification/FirebaseApi.dart';
import 'package:eplayer_flutter_mobile/view/onboarding/OnboardHome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotify();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: OnBoardHome(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Floating Bubble Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Open the floating bubble
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BubbleScreen()),
            );
          },
          child: Text('Open Bubble'),
        ),
      ),
    );
  }
}

class BubbleScreen extends StatefulWidget {
  @override
  _BubbleScreenState createState() => _BubbleScreenState();
}

class _BubbleScreenState extends State<BubbleScreen> {
  double xPos = 0;
  double yPos = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Your app content goes here
          Positioned(
            top: 100,
            left: 20,
            child: Text('Your App Content'),
          ),
          Positioned(
            top: yPos,
            left: xPos,
            child: Draggable(
              child: YourBubbleContent(),
              feedback: YourBubbleContent(),
              childWhenDragging: Container(),
              onDragEnd: (details) {
                setState(() {
                  xPos = details.offset.dx;
                  yPos = details.offset.dy;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class YourBubbleContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(Icons.message),
        onPressed: () {
          // Define the action when the bubble content is clicked
        },
        color: Colors.white,
      ),
    );
  }
}