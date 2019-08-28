import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tvmaze_search_bloc/blocs/SearchEpisodeBloc.dart';
import 'package:tvmaze_search_bloc/model/episode/list/ListEpisode.dart';
import 'package:tvmaze_search_bloc/component/tiles/search/details/tvshow/episodes/CardEpisodes.dart';

class DetailsEpisodeList extends StatelessWidget {

  final Observable<ListEpisode> listEpisodeFlux;

  DetailsEpisodeList(this.listEpisodeFlux);

  @override
  Widget build(BuildContext context) {
    print('DetailsEpisode redraw');
/*    *//* consulta de episodios BLOC *//*
    final SearchEpisodeBloc searchEpisodeBloc = new SearchEpisodeBloc();
    searchEpisodeBloc.searchEvent.add(id);*/

    return StreamBuilder<ListEpisode>(
        stream: listEpisodeFlux,
        builder:
            (BuildContext context, AsyncSnapshot<ListEpisode> snapshot) {
          return snapshot.hasData
              ? CardEpisodes(snapshot.data.episodes)
              : Container(
              height: 50,
              child: Center(
                child: CircularProgressIndicator(),
              ));
        });
  }
}

