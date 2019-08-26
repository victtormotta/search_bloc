import 'package:tvmaze_search_bloc/blocs/Bloc.dart';
import 'package:tvmaze_search_bloc/model/season/list/ListSeason.dart';
import '../services/data/Service.dart';
import 'package:rxdart/rxdart.dart';

import 'SearchEpisodeBloc.dart';
/*
  Search seasons based on show's id
 */
class SearchSeasonBloc {

  final _searchController = new BehaviorSubject<String>();
  Observable<String> get searchFlux => _searchController.stream;
  Sink<String> get searchEvent => _searchController.sink;

  Observable<ListSeason> apiResultFlux;

  SearchSeasonBloc(){
    apiResultFlux = searchFlux
        .distinct()
        .asyncMap(new Service().searchSeasons)
        .switchMap((valor) => Observable.just(valor));
  }

  void dispose(){
    _searchController?.close();
  }
}