class Endpoint {
  Endpoint._();

  // base url
  static const String baseUrl = "https://api.themoviedb.org/3/";

  // receiveTimeout
  static const int receiveTimeout = 30000;

  // connectTimeouts
  static const int connectionTimeout = 30000;

  // category endpoints
  static String getMoviesByCategorysPath(String category) {
    return baseUrl + "movie/$category";
  }

  // category endpoints
  static String getMovieDetail(int movieId) {
    return baseUrl + "movie/$movieId";
  }

  // base url image
  static const String baseImageW300 = "https://image.tmdb.org/t/p/w300";

  // base url image w500
  static const String baseImageW500 = "https://image.tmdb.org/t/p/w500";
}
