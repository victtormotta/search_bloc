import 'package:tvmaze_search_bloc/constants/Constants.dart' as Constants;
import 'package:tvmaze_search_bloc/model/tvshow/list/ListTvShow.dart';
import '../services/data/Service.dart';
import 'package:rxdart/rxdart.dart';

class LoadBloc {

  Service _service = new Service();
  final _loadController = new BehaviorSubject<String>();
  Observable<String> get searchFlux => _loadController.stream;
  Sink<String> get searchEvent => _loadController.sink;

  Observable<ListTvShow> apiResultFlux;

  LoadBloc(){
    addEventSink();
    apiResultFlux = searchFlux
        .distinct()
        .asyncMap(_service.load)
        .switchMap((valor) => Observable.just(valor));
  }

  void dispose(){
    _loadController?.close();
  }

  void addEventSink(){
    searchEvent.add("${Constants.URL_LOAD}");
  }
}