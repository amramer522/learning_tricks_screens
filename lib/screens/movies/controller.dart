import 'package:dio/dio.dart';

import 'model.dart';

class MoviesController
{

  Future<MyMoviesDetails> getData()async
  {

    var response = await Dio().get("https://api.themoviedb.org/3/discover/movie?api_key=2001486a0f63e9e4ef9c4da157ef37cd&page=9");
    Map<String,dynamic> myMap = response.data;
    MyMoviesDetails model = MyMoviesDetails.fromJson(myMap);
    return model;
  }




}