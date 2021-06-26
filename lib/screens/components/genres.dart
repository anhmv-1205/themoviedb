import 'package:flutter/cupertino.dart';
import 'package:themoviedb/screens/components/genres_card.dart';

import '../../constants.dart';

class Genres extends StatelessWidget {
  const Genres({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> genres = ["Action", "Crime", "Comedy", "Drama", "Horror", "Animation"];
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
      height: 36,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: genres.length,
          itemBuilder: (context, index) {
            return GenresCard(genres: genres[index]);
          }),
    );
  }
}
