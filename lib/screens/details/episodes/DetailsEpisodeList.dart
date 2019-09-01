import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tvmaze_search_bloc/blocs/SearchEpisodeBloc.dart';
import 'package:tvmaze_search_bloc/model/episode/list/ListEpisode.dart';
import 'package:tvmaze_search_bloc/component/tiles/details/episodes/ListEpisodesCard.dart';
import 'package:tvmaze_search_bloc/model/season/Season.dart';

class DetailsEpisodeList extends StatelessWidget {

  final String id;
  final String seasonNumber;

  DetailsEpisodeList(this.id, this.seasonNumber);

  @override
  Widget build(BuildContext context) {
    print('DetailsEpisode redraw');
    /* consulta de episodios BLOC */
    SearchEpisodeBloc searchEpisodeBloc = new SearchEpisodeBloc(seasonNumber);
    searchEpisodeBloc.searchEvent.add(id);

    return StreamBuilder<ListEpisode>(
        stream: searchEpisodeBloc.apiResultFlux,
        builder:
            (BuildContext context, AsyncSnapshot<ListEpisode> snapshot) {
          return snapshot.hasData
              ? ListEpisodesCard(snapshot.data.episodes)
              : Container(
              height: 50,
              child: Center(
                child: CircularProgressIndicator(),
              ));
        });
  }
}

