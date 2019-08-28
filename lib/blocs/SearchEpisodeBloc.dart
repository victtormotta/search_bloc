import 'package:tvmaze_search_bloc/blocs/Bloc.dart';
import 'package:tvmaze_search_bloc/blocs/SearchSeasonBloc.dart';
import 'package:tvmaze_search_bloc/model/episode/Episode.dart';
import 'package:tvmaze_search_bloc/model/episode/list/ListEpisode.dart';
import 'package:tvmaze_search_bloc/model/season/Season.dart';
import 'package:tvmaze_search_bloc/model/season/list/ListSeason.dart';
import '../services/data/Service.dart';
import 'package:rxdart/rxdart.dart';
/*
  Search episodes based on show's id
 */
class SearchEpisodeBloc extends Bloc {

  Observable<ListEpisode> apiResultFlux;

  SearchEpisodeBloc(List<Season> listSeason){
    apiResultFlux = searchFlux
        .distinct()
        .asyncMap(new Service().searchEpisodes)
        .switchMap((listEpisodeFlux) => Observable.just(getEpisodesBySeason(listEpisodeFlux, listSeason)));
  }

  ListEpisode getEpisodesBySeason(ListEpisode listEpisode, List<Season> listSeason){
    for(Season season in listSeason)
      listEpisode.episodes.removeWhere((episode) => episode.season != season.number);

    return listEpisode;
  }
}