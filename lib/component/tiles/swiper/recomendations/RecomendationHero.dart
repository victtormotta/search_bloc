import 'package:flutter/cupertino.dart';
import 'package:tvmaze_search_bloc/component/transition/FadeRoute.dart';
import 'package:tvmaze_search_bloc/model/tvshow/TvShow.dart';
import 'package:tvmaze_search_bloc/screens/search/details/tvshow/DetailsPage.dart';
import 'package:tvmaze_search_bloc/constants/Constants.dart' as Constants;

class RecomendationHero extends StatelessWidget{

  final TvShow item;
  final String tagName;

  RecomendationHero(this.item, this.tagName);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: GestureDetector(
        child: Hero(
          tag: tagName,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18.0),
            child: FadeInImage(
              image: NetworkImage(item.image),
              fit: BoxFit.cover,
              placeholder: NetworkImage(Constants.PLACEHOLDER_TV_SHOW),
            ),
          ),
        ),
        onTap: () =>
            Navigator.push(context, FadeRoute(page: DetailsPage(item))),
      ),
    );
  }
}