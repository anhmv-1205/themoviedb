// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieStore on _MovieStore, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_MovieStore.loading'))
      .value;

  final _$fetchMoviesFutureAtom = Atom(name: '_MovieStore.fetchMoviesFuture');

  @override
  ObservableFuture<List<Movie>?> get fetchMoviesFuture {
    _$fetchMoviesFutureAtom.reportRead();
    return super.fetchMoviesFuture;
  }

  @override
  set fetchMoviesFuture(ObservableFuture<List<Movie>?> value) {
    _$fetchMoviesFutureAtom.reportWrite(value, super.fetchMoviesFuture, () {
      super.fetchMoviesFuture = value;
    });
  }

  final _$movieListAtom = Atom(name: '_MovieStore.movieList');

  @override
  List<Movie>? get movieList {
    _$movieListAtom.reportRead();
    return super.movieList;
  }

  @override
  set movieList(List<Movie>? value) {
    _$movieListAtom.reportWrite(value, super.movieList, () {
      super.movieList = value;
    });
  }

  final _$movieDetailAtom = Atom(name: '_MovieStore.movieDetail');

  @override
  Movie? get movieDetail {
    _$movieDetailAtom.reportRead();
    return super.movieDetail;
  }

  @override
  set movieDetail(Movie? value) {
    _$movieDetailAtom.reportWrite(value, super.movieDetail, () {
      super.movieDetail = value;
    });
  }

  final _$getMoviesAsyncAction = AsyncAction('_MovieStore.getMovies');

  @override
  Future<dynamic> getMovies({String category = "popular"}) {
    return _$getMoviesAsyncAction
        .run(() => super.getMovies(category: category));
  }

  final _$getMovieDetailAsyncAction = AsyncAction('_MovieStore.getMovieDetail');

  @override
  Future getMovieDetail(int movieId) {
    return _$getMovieDetailAsyncAction.run(() => super.getMovieDetail(movieId));
  }

  @override
  String toString() {
    return '''
fetchMoviesFuture: ${fetchMoviesFuture},
movieList: ${movieList},
movieDetail: ${movieDetail},
loading: ${loading}
    ''';
  }
}
