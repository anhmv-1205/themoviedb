import 'package:flutter/material.dart';
import 'package:themoviedb/models/movie.dart';
import 'package:themoviedb/screens/details/components/body.dart';

class DetailScreen extends StatelessWidget {
  final Movie movie;

  const DetailScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(movie: movie),
    );
  }
}

