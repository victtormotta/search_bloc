import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tvmaze_search_bloc/blocs/SearchEpisodeBloc.dart';
import 'package:tvmaze_search_bloc/blocs/SearchSeasonBloc.dart';
import 'package:tvmaze_search_bloc/blocs/SearchSeasonBloc.dart';
import 'package:tvmaze_search_bloc/component/tiles/search/details/tvshow/seasons/ListSeasonsWidget.dart';
import 'package:tvmaze_search_bloc/model/season/list/ListSeason.dart';

/*class DetailsSeasonList extends StatefulWidget {
  DetailsSeasonList({Key key, this.id, this.searchSeasonBloc}) : super(key: key);

  final String id;
  final SearchSeasonBloc searchSeasonBloc;

  @override
  _DetailsSeasonListState createState() => _DetailsSeasonListState();
}

class _DetailsSeasonListState extends State<DetailsSeasonList> {
  @override
  Widget build(BuildContext context) {
    print('DetailsSeason redraw');
    return StreamBuilder<ListSeason>(
        stream: widget.searchSeasonBloc.apiResultFlux,
        builder:
            (BuildContext context, AsyncSnapshot<ListSeason> snapshot) {
          return snapshot.hasData
              ? ListSeasonsWidget(id: widget.id, seasons: snapshot.data.seasons)
              : Container(
              child: Center(
                child: CircularProgressIndicator(),
              ));
        });
  }
}*/


class DetailsSeasonList extends StatelessWidget {
  final String id;
  final SearchSeasonBloc searchSeasonBlocBloc;

  DetailsSeasonList(this.id, this.searchSeasonBlocBloc);

  @override
  Widget build(BuildContext context) {
    print('DetailsSeason redraw');
//    print(searchSeasonBlocBloc);
    return StreamBuilder<ListSeason>(
        stream: searchSeasonBlocBloc.apiResultFlux,
        builder:
            (BuildContext context, AsyncSnapshot<ListSeason> snapshot) {
          return snapshot.hasData
              ? ListSeasonsWidget(id, snapshot.data.seasons)
              : Container(
              child: Center(
                child: CircularProgressIndicator(),
              ));
        });
  }
}
