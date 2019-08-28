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

  SearchEpisodeBloc(String seasonNumber){

//    print(searchFlux.listen((valor) => print(valor)));

      apiResultFlux = searchFlux
        .distinct()
        .asyncMap(new Service().searchEpisodes)
        .switchMap((listEpisodeFlux) => Observable.just(getEpisodesBySeason(listEpisodeFlux, seasonNumber)));
  }

  ListEpisode getEpisodesBySeason(ListEpisode listEpisode, String seasonNumber){
    listEpisode.episodes.removeWhere((episode) => episode.season != seasonNumber);

    return listEpisode;
  }
}