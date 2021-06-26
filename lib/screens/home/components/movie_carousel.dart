import 'package:flutter/material.dart';
import 'package:themoviedb/constants.dart';
import 'package:themoviedb/models/movie.dart';
import 'dart:math' as math;

import 'package:themoviedb/screens/home/components/movie_card.dart';

class MovieCarousel extends StatefulWidget {
  @override
  _MovieCarouselState createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  late PageController _pageController;
  int initialPage = 1;

  @override
  void initState() {
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: initialPage,
    );
    super.initState();
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
      child: AspectRatio(
        aspectRatio: 0.8,
        child: PageView.builder(
            onPageChanged: (index) => {
                  setState(
                    () {
                      initialPage = index;
                    },
                  )
                },
            physics: ClampingScrollPhysics(),
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return buildMovieSlider(index);
            }),
      ),
    );
  }

  Widget buildMovieSlider(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 0;
        if (_pageController.position.haveDimensions) {
          value = index - _pageController.page!;
          print('index $index}');
          print('value1 $value}');
          value = (value * 0.038).clamp(-1, 1);
          print('value2 $value}');
        }
        return AnimatedOpacity(
          duration: Duration(microseconds: 350),
          opacity: initialPage == index ? 1 : 0.4,
          child: Transform.rotate(
            angle: math.pi * value,
            child: MovieCard(movie: movies[index]),
          ),
        );
      },
    );
  }
}
