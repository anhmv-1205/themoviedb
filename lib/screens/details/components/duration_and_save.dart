import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:themoviedb/stores/movie/movie_store.dart';

import '../../../constants.dart';

class DurationAndSave extends StatelessWidget {
  const DurationAndSave({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieStore movieStore = Provider.of<MovieStore>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: [
          Expanded(
            child: Observer(
              builder: (_) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${movieStore.movieDetail?.title}',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(
                    height: kDefaultPadding / 4,
                  ),
                  Row(
                    children: [
                      Text(
                        '${movieStore.movieDetail?.releaseDate}',
                        style: TextStyle(color: kTextLightColor),
                      ),
                      SizedBox(
                        width: kDefaultPadding,
                      ),
                      Text(
                        '${movieStore.movieDetail?.status}',
                        style: TextStyle(color: kTextLightColor),
                      ),
                      SizedBox(
                        width: kDefaultPadding,
                      ),
                      Text(
                        '${movieStore.movieDetail?.releaseDate}',
                        style: TextStyle(color: kTextLightColor),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 42,
            height: 42,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: kSecondaryColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
