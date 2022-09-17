class ApiConstance {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = '3d7fa229a6180581113adb247ed805ac';
  static const String nowPlayingMoviesPath =
      "$baseUrl/movie/now_playing?api_key=$apiKey";
  static const String popularMoviesPath =
      "$baseUrl/movie/popular?api_key=$apiKey";
  static const String topRatedMoviesPath =
      "$baseUrl/movie/top_rated?api_key=$apiKey";

  static  String movieDetailPath (movieId) =>
      "$baseUrl/movie/$movieId?api_key=$apiKey";
  static  String moviesRecommendationsPath (movieId) =>
      "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";

  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static String imageUrl(String path) => '$baseImageUrl$path';
}


// https://api.themoviedb.org/3/movie/238/recommendations?api_key=3d7fa229a6180581113adb247ed805ac