import 'package:tvmaze_search_bloc/blocs/Bloc.dart';
import 'package:tvmaze_search_bloc/model/season/list/ListSeason.dart';
import '../services/data/Service.dart';
import 'package:rxdart/rxdart.dart';

import 'SearchEpisodeBloc.dart';
/*
  Search seasons based on show's id
 */
class SearchSeasonBloc extends Bloc {

  Observable<ListSeason> apiResultFlux;

  SearchSeasonBloc(){
    apiResultFlux = searchFlux
        .distinct()
        .asyncMap(new Service().searchSeasons)
        .switchMap((valor) => Observable.just(valor));
  }
}