import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themoviedb/data/network/constants/end_points.dart';
import 'package:themoviedb/models/movie.dart';
import 'package:themoviedb/screens/details/detail_screen.dart';

import '../../../constants.dart';

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
      child: OpenContainer(
        closedElevation: 0,
        openElevation: 0,
        openBuilder: (context, action) => DetailScreen(
          movieId: movie.id ?? 0,
        ),
        closedBuilder: (context, action) => Column(
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 0.7,
                child: CachedNetworkImage(
                  imageUrl: Endpoint.baseImageW300 + movie.posterPath!,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                        // colorFilter:
                        //     ColorFilter.mode(Colors.red, BlendMode.colorBurn),
                      ),
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [kDefaultShadow],
                    ),
                  ),
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
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
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
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
                Text('${movie.voteAverage}'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
