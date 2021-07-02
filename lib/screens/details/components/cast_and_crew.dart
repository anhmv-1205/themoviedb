import 'package:flutter/material.dart';
import 'package:themoviedb/models/movie.dart';

import '../../../constants.dart';

class CastAndCrew extends StatelessWidget {
  final Movie movie;

  const CastAndCrew({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cast & Crew',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(
            height: kDefaultPadding / 2,
          ),
          SizedBox(
            height: 160,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movie.cast.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(
                      right: kDefaultPadding,
                    ),
                    width: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(movie.cast[index]['image']),
                            ),
                          ),
                        ),
                        Text(
                          '${movie.cast[index]['orginalName']}',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyText2,
                          maxLines: 2,
                        ),
                        Text(
                          '${movie.cast[index]['movieName']}',
                          style: TextStyle(
                            color: kTextLightColor,
                          ),
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
