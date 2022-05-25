import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screens/aspect_ratio/view.dart';
import 'screens/confetti_animation/view.dart';
import 'screens/flip_paper/view.dart';
import 'screens/grid/view.dart';
import 'screens/movie_db/view.dart';
import 'screens/neon_button/view.dart';
import 'screens/reverse/view.dart';

void main() async{
  getMyData().then((value) {
    print(value);
  });
  print(printData());
  runApp(const MyApp());
}

String printData(){
  return "hi";
}

Future<String> getMyData() async {
  return Future.delayed(Duration(seconds: 5),() => "hello",);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PageView(
          children: [
            GridScreen(),
            ReverseScreen(),
            MoviesScreen(),
            AspectRatioScreen(),
            ConfettiScreen(),
            FlipPaperScreen(),
            NeonButtonScreen(),
          ],
        ),
      ),
    );
  }
}
