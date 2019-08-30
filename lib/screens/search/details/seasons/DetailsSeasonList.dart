import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tvmaze_search_bloc/blocs/SearchSeasonBloc.dart';
import 'package:tvmaze_search_bloc/component/tiles/search/details/tvshow/seasons/ListSeasonsWidget.dart';
import 'package:tvmaze_search_bloc/model/season/list/ListSeason.dart';

class DetailsSeasonList extends StatelessWidget {
  final String id;

  DetailsSeasonList(this.id);

  @override
  Widget build(BuildContext context) {
    print('DetailsSeason redraw');

    final SearchSeasonBloc searchSeasonBloc = SearchSeasonBloc();
    searchSeasonBloc.searchEvent.add(id);

    return StreamBuilder<ListSeason>(
        stream: searchSeasonBloc.apiResultFlux,
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