import 'package:themoviedb/data/network/apis/movie/movie_api.dart';
import 'package:themoviedb/models/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getListMovieByCategory(String category);

  Future<Movie> getMovieDetail(int movieId);
}

class MovieRepositoryIml extends MovieRepository {
  final MovieApi _movieApi;

  MovieRepositoryIml(this._movieApi);

  @override
  Future<List<Movie>> getListMovieByCategory(String category) {
    return _movieApi.getMoviesByCategory(category);
  }

  @override
  Future<Movie> getMovieDetail(int movieId) {
    return _movieApi.getMovieDetail(movieId);
  }
}
