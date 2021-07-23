import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:themoviedb/data/network/apis/movie/movie_api.dart';
import 'package:themoviedb/data/network/dio_client.dart';
import 'package:themoviedb/data/repositories/movie_repository.dart';
import 'package:themoviedb/di/module/network_model.dart';
import 'package:themoviedb/stores/movie/movie_store.dart';

final getIt = GetIt.instance;

void setupLocator() {
  // singletons
  getIt.registerSingleton<Dio>(NetworkModule.provideDio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));

  // api
  getIt.registerSingleton(MovieApi(getIt<DioClient>()));

  // repository
  getIt.registerSingleton(MovieRepositoryIml(getIt<MovieApi>()));

  // stores
  getIt.registerSingleton(MovieStore(getIt<MovieRepositoryIml>()));
}
