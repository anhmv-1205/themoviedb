import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:themoviedb/constants.dart';
import 'package:themoviedb/screens/details/components/cast.dart';
import 'package:themoviedb/screens/details/components/crew.dart';
import 'package:themoviedb/screens/details/components/duration_and_save.dart';
import 'package:themoviedb/stores/movie/movie_store.dart';

import 'backdrop_and_rating.dart';
import 'genres.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieStore movieStore = Provider.of<MovieStore>(context, listen: false);
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BackdropAndRating(size: size),
          SizedBox(
            height: kDefaultPadding * 2,
          ),
          DurationAndSave(),
          SizedBox(
            height: kDefaultPadding,
          ),
          Genres(),
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
            child: Observer(
              builder: (_) => Text(
                '${movieStore.movieDetail?.overview}',
                style: TextStyle(
                  height: 1.5,
                  color: Color(0xFF737599),
                ),
              ),
            ),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Cast(),
          Crew(),
        ],
      ),
    );
  }
}
