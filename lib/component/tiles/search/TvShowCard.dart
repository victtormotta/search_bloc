import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvmaze_search_bloc/component/transition/FadeRoute.dart';
import 'package:tvmaze_search_bloc/model/tvshow/TvShow.dart';
import 'package:tvmaze_search_bloc/screens/search/details/tvshow/DetailsPage.dart';
import 'package:tvmaze_search_bloc/constants/Constants.dart' as Constants;
/*
  Class responsible for display the tvshow card;
 */
class TvShowCard extends StatelessWidget {

  final TvShow item;

  TvShowCard(this.item);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            FadeRoute(page: DetailsPage(item)));
      },
      child: Card(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 0.63,
                child: Hero(
                  tag: item.url,
                  transitionOnUserGestures: true,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: FadeInImage(
                      image: NetworkImage(item.image),
                      fit: BoxFit.fill,
                      placeholder: NetworkImage(Constants.PLACEHOLDER_TV_SHOW),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
