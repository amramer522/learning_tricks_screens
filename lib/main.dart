import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screens/aspect_ratio/view.dart';
import 'screens/confetti_animation/view.dart';
import 'screens/counter/view.dart';
import 'screens/flip_paper/view.dart';
import 'screens/flow/view.dart';
import 'screens/grid/view.dart';
import 'screens/movie_db/view.dart';
import 'screens/movies/view.dart';
import 'screens/neon_button/view.dart';
import 'screens/reverse/view.dart';

void main() async{
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.orange
          )
        ),
        home: CounterScreen(),
        // home: PageView(
        //   children: [
        //     MoviesScreen(),
        //     GridScreen(),
        //     ReverseScreen(),
        //     MoviesScreen(),
        //     AspectRatioScreen(),
        //     ConfettiScreen(),
        //     FlipPaperScreen(),
        //     NeonButtonScreen(),
        //   ],
        // ),
      ),
    );
  }
}
