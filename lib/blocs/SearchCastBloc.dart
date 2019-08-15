import 'package:tvmaze_search_bloc/model/ListCastTvMaze.dart';

import '../model/ListFromSearchTvMaze.dart';
import '../services/data/Service.dart';
import 'package:rxdart/rxdart.dart';

class SearchCastBloc {

  Service _service = new Service();
  final _searchCastController = new BehaviorSubject<String>();
  Observable<String> get searchFlux => _searchCastController.stream;
  Sink<String> get searchEvent => _searchCastController.sink;
  Observable<ListCastTvMaze> apiResultFlux;

  SearchCastBloc(){
    apiResultFlux = searchFlux
        .distinct()
        .asyncMap(_service.searchCast)
        .switchMap((valor) => Observable.just(valor));
  }

  void dispose(){
    _searchCastController?.close();
  }

}