import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:themoviedb/stores/movie/movie_store.dart';

import '../../../constants.dart';

class Genres extends StatelessWidget {
  const Genres({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieStore movieStore = Provider.of<MovieStore>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: SizedBox(
        height: 36,
        child: Observer(
          builder: (_) => ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movieStore.movieDetail?.genres?.length,
            itemBuilder: (context, index) {
              return Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(right: kDefaultPadding),
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding, vertical: kDefaultPadding / 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black26),
                ),
                child: Text(
                  movieStore.movieDetail?.genres?[index]?.name ?? "",
                  style: TextStyle(
                    color: kTextColor.withOpacity(0.8),
                    fontSize: 16,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
