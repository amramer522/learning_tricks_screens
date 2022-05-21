import 'package:flutter/material.dart';
import 'package:learning_screens/screens/movie_db/controller.dart';

class MoviesScreen extends StatefulWidget {
   MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final controller = MovieDBController();

  @override
  void initState() {
    super.initState();
    controller.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
