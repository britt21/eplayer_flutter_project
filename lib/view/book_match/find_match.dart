import 'package:eplayer_flutter_mobile/widgets/Utils.dart';
import 'package:flutter/material.dart';
import '../../drawables/pngs.dart';

class FindMatch extends StatefulWidget {
  @override
  State<FindMatch> createState() => _FindMatchState();
}

class _FindMatchState extends State<FindMatch>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isExpanded = false; // To track the state of the animation

  @override
  void initState() {
    super.initState();

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
      appBar: EplayerHomeAppnoback("Finding a match"),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(seconds: 1),
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
    );
  }
}
