import '../model/ListFromSearchTvMaze.dart';
import '../services/data/Service.dart';
import 'package:rxdart/rxdart.dart';


/*
  O fluxo atual recebe string então, é feito uma transformação p/ objeto da classe SearchResult;

  distinct -> valores distintos;

  where -> fornece condição;

  asyncMap ->  This acts like map, except that convert may return a Future, and in that
  case, the stream waits for that future to complete before continuing with
  its result;

  switchMap -> pega um valor, retorna um observable com o valor e quando receber um novo valor,
  faz com que as streams anteriores parem de ser recebidas;
  basicamente, para de ouvir qualquer outro estado; ouve sempre o mais atual do asyncMap;

  */
// RESUMO: um filtro com parametros, e p/ remover o penultimo termo e só é enviar p/ consulta o último;

class SearchBloc {

  Service _service = new Service();

  // esse BehaviorSubject será tipado para receber apenas string
  final _searchController = new BehaviorSubject<String>();
  // criando get
  Observable<String> get searchFlux => _searchController.stream;
  // a forma que teremos para add eventos ao fluxo
  Sink<String> get searchEvent => _searchController.sink;

  Observable<ListFromSearchTvMaze> apiResultFlux;

  SearchBloc(){
    apiResultFlux = searchFlux
        .distinct()
//        .where((valor) => valor.length > 3)
        .debounceTime(const Duration(milliseconds: 600))
        .asyncMap(_service.search)
        .switchMap((valor) => Observable.just(valor));
  }

  // boa pratica p/ fechar a stream
  void dispose(){
    _searchController?.close();
  }
}
