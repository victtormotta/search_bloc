import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tvmaze_search_bloc/blocs/SearchSeasonBloc.dart';
import 'package:tvmaze_search_bloc/component/tiles/search/details/tvshow/seasons/ListSeasonsWidget.dart';
import 'package:tvmaze_search_bloc/model/season/list/ListSeason.dart';

class DetailsSeasonList extends StatelessWidget {
  final String id;
  final SearchSeasonBloc searchSeasonBlocBloc;

  DetailsSeasonList(this.id, this.searchSeasonBlocBloc);

  @override
  Widget build(BuildContext context) {
    print('DetailsSeason redraw');
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
