import 'package:flutter/material.dart';
import 'package:themoviedb/screens/home/components/categories.dart';

import 'movie_carousel.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Categories(),
        // Genres(),
        Expanded(child: MovieCarousel()),
      ],
    );
  }
}
