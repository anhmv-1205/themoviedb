import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:themoviedb/data/network/constants/end_points.dart';
import 'package:themoviedb/stores/movie/movie_store.dart';

import '../../../constants.dart';

class BackdropAndRating extends StatelessWidget {
  const BackdropAndRating({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    MovieStore movieStore = Provider.of<MovieStore>(context, listen: false);
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      child: Stack(
        children: [
          Observer(
            builder: (_) => movieStore.movieDetail?.backdropPath != null
                ? SizedBox(
                    height: size.height * 0.4 - 50,
                    child: Observer(
                      builder: (_) => CachedNetworkImage(
                        imageUrl: Endpoint.baseImageW300 +
                            (movieStore.movieDetail?.backdropPath ?? ""),
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                            ),
                            boxShadow: [kDefaultShadow],
                          ),
                        ),
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  )
                : SizedBox(height: size.height * 0.4 - 50),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 100,
              width: size.width * 0.95,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF12153D).withOpacity(0.2),
                    offset: Offset(0, 5),
                    blurRadius: 50,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding / 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/star_fill.svg',
                          ),
                          SizedBox(
                            height: kDefaultPadding / 4,
                          ),
                          Observer(
                            builder: (_) => RichText(
                              text: TextSpan(
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                    text:
                                        '${movieStore.movieDetail?.voteAverage}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(text: '/10\n'),
                                  TextSpan(
                                    text:
                                        '${movieStore.movieDetail?.voteCount}',
                                    style: TextStyle(color: kTextLightColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/star.svg',
                          ),
                          SizedBox(
                            height: kDefaultPadding / 4,
                          ),
                          Text(
                            'Rate this',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Center(
                              child: Observer(
                                builder: (_) => Text(
                                  '${movieStore.movieDetail?.voteCount}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: kDefaultPadding / 4,
                          ),
                          Text(
                            'Metascore',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Text(
                            '62 critic reviews',
                            style: TextStyle(
                              color: kTextLightColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(child: BackButton())
        ],
      ),
    );
  }
}
