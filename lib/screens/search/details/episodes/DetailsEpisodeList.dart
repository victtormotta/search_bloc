import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tvmaze_search_bloc/blocs/SearchEpisodeBloc.dart';
import 'package:tvmaze_search_bloc/component/tiles/search/details/tvshow/PosterFullSize.dart';
import 'package:tvmaze_search_bloc/component/transition/FadeRoute.dart';
import 'package:tvmaze_search_bloc/model/episode/Episode.dart';
import 'package:tvmaze_search_bloc/model/episode/list/ListEpisode.dart';
import 'package:tvmaze_search_bloc/component/tiles/search/details/tvshow/episodes/CardEpisodes.dart';
import 'package:tvmaze_search_bloc/constants/Constants.dart' as Constants;

class DetailsEpisodeList extends StatelessWidget {

  final String id;
  final String seasonNumber;

  DetailsEpisodeList(this.id, this.seasonNumber);

  @override
  Widget build(BuildContext context) {
    print('DetailsEpisode redraw');
    /* consulta de episodios BLOC */
    final SearchEpisodeBloc searchEpisodeBloc = new SearchEpisodeBloc(seasonNumber);
    searchEpisodeBloc.searchEvent.add(id);

    return StreamBuilder<ListEpisode>(
        stream: searchEpisodeBloc.apiResultFlux,
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

