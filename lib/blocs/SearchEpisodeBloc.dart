import 'package:tvmaze_search_bloc/blocs/Bloc.dart';
import 'package:tvmaze_search_bloc/model/episode/list/ListEpisode.dart';
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
}