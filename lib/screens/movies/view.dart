import 'package:flutter/material.dart';

import 'controller.dart';
import 'model.dart';

class MoviesScreen extends StatelessWidget {
  MoviesScreen({Key? key}) : super(key: key);

  final controller = MoviesController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: controller.getData(),
        builder: (context, snap) {
          if (snap.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            var model = snap.data as MyMoviesDetails;
            return ListView.builder(
              itemBuilder: (context, index) => GestureDetector(
                onTap: (){

                },
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  height: 250,
                  margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.black),
                  child: Stack(
                    children: [
                      InteractiveViewer(
                        onInteractionEnd: (c)
                        {

                        },
                        child: Image.network(
                          "https://image.tmdb.org/t/p/original" +
                              model.results[index].backdropPath,
                          height: 250,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black.withOpacity(.8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.orange,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              model.results[index].voteAverage.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      ),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                              padding: EdgeInsets.all(8),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(.8),
                              ),
                              child: Text(
                                model.results[index].title.length>20? model.results[index].title.substring(0,20):model.results[index].title,
                                style:
                                    TextStyle(color: Colors.white, fontSize: 25),
                                textAlign: TextAlign.center,
                              )))
                    ],
                  ),
                ),
              ),
              itemCount: model.results.length,
            );
          }
        },
      ),
    );
  }
}
