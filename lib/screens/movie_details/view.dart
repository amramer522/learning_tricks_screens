import 'package:flutter/material.dart';

import 'controller.dart';
import 'model.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int id;

  MovieDetailsScreen({Key? key, required this.id}) : super(key: key);

  final controller = MovieDetailsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FutureBuilder(
          future: controller.getData(id: id),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return CircularProgressIndicator();
            }
            var model = snapshot.data as MovieDetailsModel;
            return Column(
              children: [
                Image.network("https://image.tmdb.org/t/p/original" +
                    model.posterPath),
                Text(model.overview)
              ],
            );
          },
        ),
      ),
    );
  }
}
