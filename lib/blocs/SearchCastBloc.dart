import 'package:tvmaze_search_bloc/blocs/Bloc.dart';
import 'package:tvmaze_search_bloc/model/cast/list/ListCast.dart';
import '../services/data/Service.dart';
import 'package:rxdart/rxdart.dart';
/*
  Search cast based on show's id
 */
class SearchCastBloc extends Bloc {

  Observable<ListCast> apiResultFlux;

  SearchCastBloc(){
    apiResultFlux = searchFlux
        .distinct()
        .asyncMap(new Service().searchCast)
        .switchMap((valor) => Observable.just(valor));
  }
}