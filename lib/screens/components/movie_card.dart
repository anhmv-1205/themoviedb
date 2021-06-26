import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themoviedb/models/movie.dart';

import '../../constants.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(movie.poster),
                ),
                borderRadius: BorderRadius.circular(50),
                boxShadow: [kDefaultShadow],
              ),
            ),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: kDefaultPadding / 2,
            ),
            child: Text(
              '${movie.title}',
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/star_fill.svg',
                height: 20,
              ),
              SizedBox(
                width: kDefaultPadding / 2,
              ),
              Text('${movie.rating}'),
            ],
          )
        ],
      ),
    );
  }
}
