import '../model/ListFromSearchTvMaze.dart';
import '../services/data/Service.dart';
import 'package:rxdart/rxdart.dart';

class LoadBloc {

  Service _service = new Service();

  final String _tvMazeAllShows = "http://api.tvmaze.com/shows";

  // esse BehaviorSubject será tipado para receber apenas string
  final _loadController = new BehaviorSubject<String>();
  // criando get
  Observable<String> get searchFlux => _loadController.stream;
  // a forma que teremos para add eventos ao fluxo
  Sink<String> get searchEvent => _loadController.sink;

  Observable<ListFromSearchTvMaze> apiResultFlux;

  LoadBloc(){
    addEventSink();
    apiResultFlux = searchFlux
        .distinct()
        .asyncMap(_service.load)
        .switchMap((valor) => Observable.just(valor));
  }

  // boa pratica p/ fechar a stream
  void dispose(){
    _loadController?.close();
  }

  void addEventSink(){
    searchEvent.add(_tvMazeAllShows);
  }
}