import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:learning_screens/screens/movie_db/controller.dart';

class Movies2Screen extends StatefulWidget {
  Movies2Screen({Key? key}) : super(key: key);

  @override
  State<Movies2Screen> createState() {
    return _Movies2ScreenState();
  }
}

class _Movies2ScreenState extends State<Movies2Screen> {
  final controller = MovieDBController();

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    await controller.getMovies();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.model == null
          ? const Center(child:  CircularProgressIndicator())
          : ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Image.network(
                      "https://image.tmdb.org/t/p/original" +
                          controller.model!.movies[index].backdropPath,
                      fit: BoxFit.fill,
                      height: 200,
                      width: 200,
                    ),
                    const SizedBox(height: 10,),
                    Text(controller.model!.movies[index].title,style: const TextStyle(color: Colors.red),)
                  ],
                ),
              ),
              itemCount: controller.model!.movies.length,
            ),
    );
  }
}
