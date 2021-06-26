import 'package:flutter/material.dart';

import '../../constants.dart';

class GenresCard extends StatelessWidget {
  const GenresCard({
    Key? key,
    required this.genres,
  }) : super(key: key);

  final String genres;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        vertical: kDefaultPadding / 4,
        horizontal: kDefaultPadding,
      ),
      margin: const EdgeInsets.only(left: kDefaultPadding / 2),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(genres),
    );
  }
}
