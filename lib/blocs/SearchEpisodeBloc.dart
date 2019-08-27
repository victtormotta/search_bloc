import 'package:tvmaze_search_bloc/blocs/Bloc.dart';
import 'package:tvmaze_search_bloc/blocs/SearchSeasonBloc.dart';
import 'package:tvmaze_search_bloc/model/episode/Episode.dart';
import 'package:tvmaze_search_bloc/model/episode/list/ListEpisode.dart';
import '../services/data/Service.dart';
import 'package:rxdart/rxdart.dart';
/*
  Search episodes based on show's id
 */
class SearchEpisodeBloc extends Bloc {

  final _searchController = new BehaviorSubject<String>();
  Observable<String> get searchFlux => _searchController.stream;
  Sink<String> get searchEvent => _searchController.sink;
  Observable<ListEpisode> apiResultFlux;

  SearchEpisodeBloc(seasonNumber){

//    if(apiResultFlux != null) print(apiResultFlux.length);

    apiResultFlux = searchFlux
        .distinct()
        .asyncMap(new Service().searchEpisodes)
        .switchMap((valor) => Observable.just(getEpisodesBySeason(valor, seasonNumber)));
  }

  ListEpisode getEpisodesBySeason(ListEpisode listEpisode, String seasonNumber){
    listEpisode.episodes.removeWhere((episode) => episode.season != seasonNumber);
    return listEpisode;
  }
}