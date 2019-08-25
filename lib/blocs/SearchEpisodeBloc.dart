import 'package:tvmaze_search_bloc/blocs/Bloc.dart';
import 'package:tvmaze_search_bloc/model/episode/Episode.dart';
import 'package:tvmaze_search_bloc/model/episode/list/ListEpisode.dart';
import 'package:tvmaze_search_bloc/model/season/Season.dart';
import '../services/data/Service.dart';
import 'package:rxdart/rxdart.dart';
/*
  Search episodes based on show's id
 */
class SearchEpisodeBloc extends Bloc {

  Observable<ListEpisode> apiResultFlux;

  SearchEpisodeBloc(){
      apiResultFlux = searchFlux
          .distinct()
          .asyncMap(new Service().searchEpisodes)
          .switchMap((valor) => Observable.just(valor));
  }

  List<Episode> returnEpisodesBySeason(List<Episode> episodesList, String seasonNumber){
    final List<Episode> episodesByIndex = [];
    /* percorre a lista, se nao tiver na indexSeason, remove o episode */
    for(Episode episode in episodesList){
      if(episode.season == seasonNumber)
        episodesByIndex.add(episode);
    }
    return episodesByIndex;
  }
}