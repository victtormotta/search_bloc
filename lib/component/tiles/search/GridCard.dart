import 'package:flutter/material.dart';
import 'package:tvmaze_search_bloc/model/tvshow/TvShow.dart';
import 'package:tvmaze_search_bloc/model/tvshow/list/ListTvShow.dart';

import 'TvShowCard.dart';

/*
  Class responsible for the tvshow card;
 */
class GridCard extends StatelessWidget {
  final ListTvShow listTvShow;

  GridCard(this.listTvShow);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        scrollDirection: Axis.vertical,
        physics: PageScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.all(5.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 2.0,
          crossAxisSpacing: 2.0,
          childAspectRatio: 0.64,
        ),
        itemCount: listTvShow.tvShows.length,
        itemBuilder: (context, index) {
          TvShow item = listTvShow.tvShows[index];
          return TvShowCard(item);
        });
  }
}
