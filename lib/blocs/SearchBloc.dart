import 'package:tvmaze_search_bloc/model/tvshow/list/ListTvShow.dart';
import '../services/data/Service.dart';
import 'package:rxdart/rxdart.dart';

import 'Bloc.dart';
/*
  Search show by name
 */
class SearchBloc extends Bloc {

  Observable<ListTvShow> apiResultFlux;

  SearchBloc(){
    apiResultFlux = searchFlux
        .distinct()
//        .where((valor) => valor.length > 3)
        .debounceTime(const Duration(milliseconds: 600))
        .asyncMap(new Service().search)
        .switchMap((valor) => Observable.just(valor));
  }
}
