import 'package:eplayer_flutter_mobile/widgets/Utils.dart';
import 'package:eplayer_flutter_mobile/widgets/app_button.dart';
import 'package:flutter/material.dart';

class BookMatch extends StatefulWidget {
  const BookMatch({super.key});

  @override
  State<BookMatch> createState() => _BookMatchState();
}

class _BookMatchState extends State<BookMatch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EplayerAppBar("Match Settings"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text("Enter amount"),
            AppTextView()
          ],
        ),
      ),
    );
  }
}
