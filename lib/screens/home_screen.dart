import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:themoviedb/constants.dart';
import 'package:themoviedb/screens/components/categories.dart';
import 'package:themoviedb/screens/components/movie_carousel.dart';

import 'components/genres.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          padding: EdgeInsets.only(left: kDefaultPadding),
          icon: SvgPicture.asset('assets/icons/menu.svg'),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {},
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            icon: SvgPicture.asset('assets/icons/search.svg'),
          ),
        ],
      ),
      body: Column(
        children: [
          Categories(),
          Genres(),
          SizedBox(height: kDefaultPadding,),
          MovieCarousel(),
        ],
      ),
    );
  }
}
