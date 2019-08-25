import 'package:flutter/material.dart';
import 'package:tvmaze_search_bloc/model/tvshow/TvShow.dart';
import 'package:tvmaze_search_bloc/model/tvshow/list/ListTvShow.dart';

import 'TvShowCard.dart';

/*class GridCard extends StatefulWidget {

  final ListTvShow listTvShow;

  GridCard(this.listTvShow);

  @override
  _GridCardState createState() => _GridCardState();
}

class _GridCardState extends State<GridCard> {
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
        itemCount: widget.listTvShow.tvShows.length,
        itemBuilder: (context, index) {
          TvShow item = widget.listTvShow.tvShows[index];
          return TvShowCard(item);
        });
  }
}*/


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
