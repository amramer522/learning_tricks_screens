import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class GridScreen extends StatefulWidget {
  GridScreen({Key? key}) : super(key: key);

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              child: GestureDetector(
                  onTap: () {
                    ImagePicker.platform
                        .getImage(source: ImageSource.gallery)
                        .then((value) {
                      if (value != null) {
                        image = File(value.path);
                        setState(() {});
                      }
                    });
                  },
                  child: Lottie.asset('assets/no_internet.json',
                      height: 400, width: 400)),
            ),
            image != null
                ? Image.file(
                    image!,
                    height: 300,
                    width: 300,
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
      // body: GridView.count(
      //     crossAxisCount: 1,
      //     mainAxisSpacing: 10,
      //     crossAxisSpacing: 10,
      //     padding: EdgeInsets.all(16),
      //     children: List.generate(
      //         10,
      //         (index) => Container(
      //               height: 100,
      //               width: 100,
      //               color: Colors.red,
      //             )),
      // ),
    );
  }
}
