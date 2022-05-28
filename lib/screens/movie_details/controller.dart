import 'package:dio/dio.dart';

import 'model.dart';

class MovieDetailsController {
  Future<MovieDetailsModel> getData({required int id}) async {
    var response = await Dio().get(
        "https://api.themoviedb.org/3/movie/$id?api_key=2001486a0f63e9e4ef9c4da157ef37cd");
    print(response.data);
    var model = MovieDetailsModel.fromJson(response.data);
    return model;
  }
}
