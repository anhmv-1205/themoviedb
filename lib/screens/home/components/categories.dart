import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:themoviedb/constants.dart';
import 'package:themoviedb/stores/movie/movie_store.dart';

class Categories extends StatefulWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectedCategory = 0;
  List<String> categories = [
    "Popular",
    "Top Rated",
    "Upcomming",
    "Now Playing",
  ];

  List<String> categoriesKey = [
    "popular",
    "top_rated",
    "upcoming",
    "now_playing",
  ];

  late MovieStore _movieStore;

  @override
  void initState() {
    // initializing stores
    _movieStore = Provider.of<MovieStore>(context, listen: false);
    // check to see if already called api
    var hasData =
        _movieStore.movieList != null && _movieStore.movieList!.isNotEmpty;
    if (!_movieStore.loading && !hasData) {
      _movieStore.getMovies();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return buildCategory(categories, index, context);
        },
      ),
    );
  }

  Padding buildCategory(
      List<String> categories, int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (selectedCategory != index) {
              selectedCategory = index;
              _movieStore.getMovies(category: categoriesKey[index]);
            }
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              child: Text(
                categories[index],
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: index == selectedCategory
                          ? FontWeight.w600
                          : FontWeight.w500,
                      color: index == selectedCategory
                          ? kTextColor
                          : Colors.black.withOpacity(0.4),
                    ),
              ),
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInSine,
            ),
            SizedBox(
              height: kDefaultPadding / 2,
            ),
            AnimatedContainer(
              height: 6,
              width: 40,
              decoration: BoxDecoration(
                color: selectedCategory == index
                    ? kSecondaryColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              duration: Duration(milliseconds: 300),
              curve: Curves.ease,
            ),
          ],
        ),
      ),
    );
  }
}
