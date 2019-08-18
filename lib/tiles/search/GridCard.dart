import 'package:flutter/material.dart';
import 'package:tvmaze_search/model/TvShow.dart';
import '../../model/ListFromSearchTvMaze.dart';

import 'package:tvmaze_search/tiles/search/TvShowCard.dart';

/*
  Class responsible for the tvshow card;
 */
class GridCard extends StatelessWidget {
  final ListFromSearchTvMaze listFromSearchTvMaze;

  GridCard(this.listFromSearchTvMaze);

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
        itemCount: listFromSearchTvMaze.tvShows.length,
        itemBuilder: (context, index) {
          TvShow item = listFromSearchTvMaze.tvShows[index];
          return TvShowCard(item);
        });
  }
}
