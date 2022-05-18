import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlipPaperScreen extends StatefulWidget {
  FlipPaperScreen({Key? key}) : super(key: key);

  @override
  State<FlipPaperScreen> createState() => _FlipPaperScreenState();
}

class _FlipPaperScreenState extends State<FlipPaperScreen> {
  double dragPosition = 0;

  bool isFront = true;

  void setImageSide() {
    if (dragPosition <= 90 || dragPosition >= 270) {
      isFront = true;
    } else {
      isFront = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final angle = dragPosition / 180 * pi;
    final transform = Matrix4.identity()
      ..setEntry(3, 2, .001)
      ..rotateY(angle);

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(16.r),
              child: GestureDetector(
                onHorizontalDragUpdate: (details) {
                  dragPosition -= details.delta.dx;
                  dragPosition %= 360;
                  setImageSide();
                  setState(() {});
                },
                child: Transform(
                  transform: transform,
                  alignment: Alignment.center,
                  child: isFront
                      ? Image.network(
                          "https://vid.alarabiya.net/images/2018/01/28/fc40a866-d6d6-47f4-8f18-f54833d964b6/fc40a866-d6d6-47f4-8f18-f54833d964b6.jpg",
                          height: 400.h,
                          fit: BoxFit.fill,
                        )
                      : Transform(
                          transform: Matrix4.identity()..rotateX(pi),
                          alignment: Alignment.center,
                          child: Image.network(
                              "https://i.pinimg.com/736x/5a/d8/18/5ad8185b4ff1339d77cf987adfcd743b.jpg",
                              fit: BoxFit.fill,
                              height: 400.h),
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
