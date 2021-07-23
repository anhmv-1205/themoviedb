import 'package:themoviedb/data/network/constants/end_points.dart';
import 'package:themoviedb/data/network/dio_client.dart';
import 'package:themoviedb/models/movie.dart';

class MovieApi {
  final DioClient _dioClient;

  MovieApi(this._dioClient);

  Future<List<Movie>> getMoviesByCategory(String category) async {
    try {
      final res = await _dioClient.get(
          Endpoint.getMoviesByCategorysPath(category),
          queryParameters: {"api_key": "046c0fc244a191edbf4075aac74e1a8a"});

      final movies =
          (res["results"] as List).map((i) => Movie.fromJson(i)).toList();
      return movies;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<Movie> getMovieDetail(int movieId) async {
    try {
      final res = await _dioClient.get(
        Endpoint.getMovieDetail(movieId),
        queryParameters: {
          "api_key": "046c0fc244a191edbf4075aac74e1a8a",
          "append_to_response": "credits"
        },
      );

      final movie = Movie.fromJson(res);
      return movie;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
