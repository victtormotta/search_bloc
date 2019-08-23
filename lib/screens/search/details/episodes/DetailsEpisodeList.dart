import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tvmaze_search_bloc/blocs/SearchEpisodeBloc.dart';
import 'package:tvmaze_search_bloc/component/tiles/search/details/tvshow/episodes/ListEpisodesWidget.dart';
import 'package:tvmaze_search_bloc/model/episode/list/ListEpisode.dart';

class DetailsEpisodeList extends StatelessWidget {
  final SearchEpisodeBloc searchEpisodeBloc;

  DetailsEpisodeList(this.searchEpisodeBloc);

  @override
  Widget build(BuildContext context) {
    print('DetailsEpisode redraw');
    return StreamBuilder<ListEpisode>(
        stream: searchEpisodeBloc.apiResultFlux,
        builder:
            (BuildContext context, AsyncSnapshot<ListEpisode> snapshot) {
          return snapshot.hasData
              ? ListEpisodesWidget(snapshot.data.episodes)
              : Container(
              child: Center(
                child: CircularProgressIndicator(),
              ));
        });
  }
}
