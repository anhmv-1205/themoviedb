import 'package:mobx/mobx.dart';
import 'package:themoviedb/data/repositories/movie_repository.dart';
import 'package:themoviedb/models/movie.dart';

part 'movie_store.g.dart';

class MovieStore = _MovieStore with _$MovieStore;

abstract class _MovieStore with Store {
  late MovieRepositoryIml movieRepositoryIml;

  _MovieStore(this.movieRepositoryIml);

  // store variables:-----------------------------------------------------------
  static ObservableFuture<List<Movie>?> emptyMovieResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<List<Movie>?> fetchMoviesFuture =
      ObservableFuture<List<Movie>?>(emptyMovieResponse);

  @observable
  List<Movie>? movieList;

  @computed
  bool get loading => fetchMoviesFuture.status == FutureStatus.pending;

  @action
  Future getMovies({String category: "popular"}) async {
    final future = movieRepositoryIml.getListMovieByCategory(category);
    fetchMoviesFuture = ObservableFuture(future);
    future.then((value) => this.movieList = value).catchError((error) {});
  }

  @observable
  Movie? movieDetail;

  @action
  getMovieDetail(int movieId) async {
    try {
      movieDetail = await movieRepositoryIml.getMovieDetail(movieId);
    } catch (e) {
      print(e.toString());
    }
  }
}
