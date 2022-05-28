class MyMoviesDetails {
  late final int page;
  late final List<Results> results;
  late final int totalPages;
  late final int totalResults;

  MyMoviesDetails.fromJson(Map<String, dynamic> myMap){
     page =myMap['page'];
     totalPages =myMap['total_pages'];
     results = List.from(myMap['results']).map((e) => Results.fromJson(e)).toList();
     totalResults =myMap['total_results'];
  }
}

class Results {

  late final bool adult;
  late final String backdropPath;
  late final List<int> genreIds;
  late final int id;
  late final String originalLanguage;
  late final String originalTitle;
  late final String overview;
  late final num popularity;
  late final String posterPath;
  late final String releaseDate;
  late final String title;
  late final bool video;
  late final num voteAverage;
  late final int voteCount;

  Results.fromJson(Map<String, dynamic> json){
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = List.castFrom<dynamic, int>(json['genre_ids']);
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
}



class MovieGenres {
  MovieGenres({
    required this.genres,
  });
  late final List<Genres> genres;

  MovieGenres.fromJson(Map<String, dynamic> json){
    genres = List.from(json['genres']).map((e)=>Genres.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['genres'] = genres.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Genres {
  Genres({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;

  Genres.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}