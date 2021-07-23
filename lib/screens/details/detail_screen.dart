import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:themoviedb/screens/details/components/body.dart';
import 'package:themoviedb/stores/movie/movie_store.dart';

class DetailScreen extends StatefulWidget {
  final int movieId;

  DetailScreen({Key? key, required this.movieId}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int index = 0;
  late MovieStore _movieStore;

  @override
  void initState() {
    _movieStore = Provider.of<MovieStore>(context, listen: false);
    _movieStore.getMovieDetail(widget.movieId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
