class MoviesData {
  late final int page;
  late final List<Movie> movies;
  late final int totalPages;
  late final int totalResults;

  MoviesData.fromMap(Map<String, dynamic> json){
    page = json['page'];
    movies = List.from(json['results']).map((e)=>Movie.fromMap(e)).toList();
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}

class Movie {
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
  late final num? voteAverage;
  late final int voteCount;

  Movie.fromMap(Map<String, dynamic> map){
    adult = map['adult'];
    backdropPath = map['backdrop_path'];
    genreIds = List.castFrom<dynamic, int>(map['genre_ids']);
    id = map['id'];
    originalLanguage = map['original_language'];
    originalTitle = map['original_title'];
    overview = map['overview'];
    popularity = map['popularity'];
    posterPath = map['poster_path'];
    releaseDate = map['release_date'];
    title = map['title'];
    video = map['video'];
    voteAverage = map['vote_average'];
    voteCount = map['vote_count'];
  }
}