import 'package:flutter/material.dart';
import 'package:tvmaze_search_bloc/model/season/Season.dart';
import 'package:tvmaze_search_bloc/model/episode/Episode.dart';
import 'package:tvmaze_search_bloc/blocs/SearchEpisodeBloc.dart';
import 'package:tvmaze_search_bloc/component/transition/FadeRoute.dart';
import 'package:tvmaze_search_bloc/constants/Constants.dart' as Constants;
import 'package:tvmaze_search_bloc/component/tiles/search/details/tvshow/PosterFullSize.dart';

import 'CardSeasons.dart';


class ListSeasonsWidget extends StatefulWidget {
  ListSeasonsWidget({Key key, this.id, this.seasons}) : super(key: key);

  final String id;
  final List<Season> seasons;

  @override
  _ListSeasonsWidgetState createState() => _ListSeasonsWidgetState();
}

class _ListSeasonsWidgetState extends State<ListSeasonsWidget> {

  SearchEpisodeBloc searchEpisodeBloc;

  @override
  Widget build(BuildContext context) {

    searchEpisodeBloc = new SearchEpisodeBloc();
    searchEpisodeBloc.searchEvent.add(widget.id);

    return SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          SizedBox(
            height: 300.0,
            child: ListView.builder(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: widget.seasons.length,
                itemBuilder: (BuildContext context, int index) {
                  final Season season = widget.seasons[index];
                  return CardSeasons(id: widget.id, seasonNumber: season.number);
                }),
          ),
          Container(
            height: 20,
          )
        ]));
  }
}



/*class ListSeasonsWidget extends StatelessWidget {
  final String id;
  final List<Season> seasons;

  ListSeasonsWidget(this.id, this.seasons);

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          SizedBox(
            height: 300.0,
            child: ListView.builder(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: seasons.length,
                itemBuilder: (BuildContext context, int index) {
                  final Season season = seasons[index];
                  return CardSeasons(id, season.number);
                }),
          ),
          Container(
            height: 20,
          )
        ]));
  }
}*/
