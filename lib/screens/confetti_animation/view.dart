import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class ConfettiScreen extends StatefulWidget {
  ConfettiScreen({Key? key}) : super(key: key);

  @override
  State<ConfettiScreen> createState() => _ConfettiScreenState();
}

class _ConfettiScreenState extends State<ConfettiScreen> {
  final controller = ConfettiController();
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      isPlaying = controller.state == ConfettiControllerState.playing;
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: ElevatedButton(
                onPressed: () {
                  if (isPlaying) {
                    controller.stop();
                  } else {
                    controller.play();
                  }
                },
                child: Text(isPlaying ? "Stop" : "Celebrate")),
          ),
        ),
        ConfettiWidget(
          confettiController: controller,
          shouldLoop: true,
          blastDirectionality: BlastDirectionality.explosive,
          // determine how heavy you want from 0 => 1
          emissionFrequency: .2,
          // push number of cards per one time
          numberOfParticles: 100,
          colors: [
            Colors.red,
            Colors.white
          ],
          // speed to go down
          gravity: 1,
          // createParticlePath: (size) {
          //   final path = Path();
          //   path.addOval(Rect.fromCircle(center: Offset.zero, radius: 10));
          //   return path;
          // },
        )
      ],
    );
  }
}
