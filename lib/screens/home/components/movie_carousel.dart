import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:themoviedb/constants.dart';
import 'package:themoviedb/models/movie.dart';
import 'package:themoviedb/screens/home/components/movie_card.dart';
import 'package:themoviedb/stores/movie/movie_store.dart';

class MovieCarousel extends StatefulWidget {
  @override
  _MovieCarouselState createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  late PageController _pageController;
  int initialPage = 1;
  late MovieStore _movieStore;

  @override
  void initState() {
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: initialPage,
    );

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // initializing stores
    _movieStore = Provider.of<MovieStore>(context, listen: false);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
      child: Observer(builder: (_) {
        initialPage = 0;
        if (_pageController.hasClients) {
          _pageController.jumpTo(initialPage.toDouble());
        }
        return PageView.builder(
          onPageChanged: (index) => {
            initialPage = index,
          },
          physics: ClampingScrollPhysics(),
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          itemCount: _movieStore.movieList?.length ?? 0,
          itemBuilder: (context, index) {
            return buildMovieSlider(_movieStore.movieList![index], index);
          },
        );
      }),
    );
  }

  Widget buildMovieSlider(Movie movie, int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 0;
        if (_pageController.position.haveDimensions == true) {
          value = index - (_pageController.page ?? 0);
          value = (value * 0.038).clamp(-1, 1);
        }
        return AnimatedOpacity(
          duration: Duration(microseconds: 350),
          opacity: initialPage == index ? 1 : 0.4,
          child: Transform.rotate(
            angle: math.pi * value,
            child: MovieCard(movie: movie),
          ),
        );
      },
    );
  }
}
