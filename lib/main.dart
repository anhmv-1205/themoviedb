import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:themoviedb/di/components/service_locator.dart';
import 'package:themoviedb/screens/home/home_screen.dart';
import 'package:themoviedb/stores/movie/movie_store.dart';

void main() {
  setupLocator();
  runApp(
    MultiProvider(
      providers: [
        Provider<MovieStore>(create: (_) => getIt<MovieStore>()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Movie DB',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
