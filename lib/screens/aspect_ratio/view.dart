import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AspectRatioScreen extends StatelessWidget {
  const AspectRatioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemBuilder: (context, index) => AspectRatio(
            aspectRatio: 1,
            child: Container(
                  // height: 100,
                  // width: 100,
                  margin: EdgeInsets.only(top: 10.h),
                  color: Colors.yellow,
                ),
          ),
          itemCount: 10),
    );
  }
}
