import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:themoviedb/data/network/constants/end_points.dart';
import 'package:themoviedb/stores/movie/movie_store.dart';

import '../../../constants.dart';

class Crew extends StatelessWidget {
  const Crew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieStore movieStore = Provider.of<MovieStore>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Crew',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(
            height: kDefaultPadding / 2,
          ),
          Observer(
            builder: (_) {
              var crew = movieStore.movieDetail?.credits?.crew;
              return Container(
                child: crew != null
                    ? SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: crew.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(
                                right: kDefaultPadding,
                              ),
                              width: 80,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  crew[index].profilePath?.isNotEmpty == true
                                      ? CachedNetworkImage(
                                          imageUrl: Endpoint.baseImageW300 +
                                              crew[index].profilePath!,
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            height: 80,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                              shape: BoxShape.circle,
                                              boxShadow: [kDefaultShadow],
                                            ),
                                          ),
                                          placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        )
                                      : Shimmer.fromColors(
                                          baseColor: Colors.grey[300]!,
                                          highlightColor: Colors.grey[100]!,
                                          child: Container(
                                            height: 80,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ),
                                  SizedBox(
                                    height: kDefaultPadding / 4,
                                  ),
                                  Text(
                                    '${crew[index].name}',
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                    maxLines: 2,
                                  ),
                                  SizedBox(
                                    height: kDefaultPadding / 4,
                                  ),
                                  Text(
                                    '${crew[index].job}',
                                    maxLines: 3,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: kTextLightColor,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    : null,
              );
            },
          ),
        ],
      ),
    );
  }
}
