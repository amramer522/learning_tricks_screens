import 'package:dio/dio.dart';
import 'package:learning_screens/screens/movie_db/model.dart';

class MovieDBController {
  getMovies() {
    Dio()
        .get(
            "https://api.themoviedb.org/3/discover/movie?api_key=2001486a0f63e9e4ef9c4da157ef37cd&page=9")
        .then((value) {
         MoviesData model = MoviesData.fromJson(value.data);
         print(model.movies.length);

    });
  }
}
