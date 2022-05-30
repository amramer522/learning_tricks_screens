import 'package:dio/dio.dart';

import 'model.dart';

class MoviesController
{


  Future<MyMoviesDetails> getData({required int genre})async
  {
    var response = await Dio().get("https://api.themoviedb.org/3/discover/movie?with_genres=$genre&api_key=2001486a0f63e9e4ef9c4da157ef37cd&");
    Map<String,dynamic> myMap = response.data;
    MyMoviesDetails model = MyMoviesDetails.fromJson(myMap);

    return model;
  }



  Future<MovieGenres> getGeneresData()async
  {

    var response = await Dio().get("https://api.themoviedb.org/3/genre/movie/list?api_key=2001486a0f63e9e4ef9c4da157ef37cd");
    Map<String,dynamic> myMap = response.data;
    MovieGenres model = MovieGenres.fromJson(myMap);
    return model;
  }



}



class Person
{
  String name;
  int age;

  Person({required this.name,required this.age});
}