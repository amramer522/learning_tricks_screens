import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NeonButtonScreen extends StatefulWidget {
  NeonButtonScreen({Key? key}) : super(key: key);

  @override
  State<NeonButtonScreen> createState() => _NeonButtonScreenState();
}

class _NeonButtonScreenState extends State<NeonButtonScreen> {
  var shadowColor = Colors.red;

  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.black,
        child: Center(
          child: Listener(
            onPointerDown: (event) {
              setState(() {
                isPressed = true;
              });
            },
            onPointerUp: (event) {
              setState(() {
                isPressed = false;
              });
            },
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  side: const BorderSide(color: Colors.white, width: 4),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r))),
              onHover: (hovered) {
                setState(() {
                  isPressed = hovered;
                });
              },
              child: Text(
                "Neon Button",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 60.sp,
                  shadows: List.generate(
                      isPressed ? 15 : 7,
                      (index) => Shadow(
                            color: shadowColor,
                            blurRadius: 3.0 * index,
                          )),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
