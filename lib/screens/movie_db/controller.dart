import 'package:dio/dio.dart';
import 'package:learning_screens/screens/movie_db/model.dart';

class MovieDBController {
  MoviesData? model;

  Future<void> getMovies() async{
    var response = await Dio().get("https://api.themoviedb.org/3/discover/movie?api_key=2001486a0f63e9e4ef9c4da157ef37cd&page=9");
    model = MoviesData.fromMap(response.data);
  }
}
