import 'package:flutter/material.dart';
import 'package:themoviedb/constants.dart';
import 'package:themoviedb/models/movie.dart';
import 'package:themoviedb/screens/details/components/cast_and_crew.dart';
import 'package:themoviedb/screens/details/components/duration_and_save.dart';

import 'backdrop_and_rating.dart';
import 'genres.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BackdropAndRating(size: size, movie: movie),
          SizedBox(
            height: kDefaultPadding * 2,
          ),
          DurationAndSave(movie: movie),
          SizedBox(
            height: kDefaultPadding,
          ),
          Genres(movie: movie),
          SizedBox(
            height: kDefaultPadding,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
            ),
            child: Text(
              'Plot Summary',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(
            height: kDefaultPadding / 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
            ),
            child: Text(
              '${movie.plot}',
              style: TextStyle(
                height: 1.5,
                color: Color(0xFF737599),
              ),
            ),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          CastAndCrew(
            movie: movie,
          ),
        ],
      ),
    );
  }
}
