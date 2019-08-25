import 'package:tvmaze_search/model/tvshow/TvShow.dart';
import 'package:tvmaze_search/model/cast/Cast.dart';

class ListCastTvMaze {
  final List<Cast> casts;

  ListCastTvMaze(this.casts);

  factory ListCastTvMaze.fromJson(List<dynamic> json) {
//    print(json["show"]);
    // pega o campo artists do json, cast como uma lista e converte cada item da lista;
    final listCasts = json?.map((cast) {
      return Cast.fromJson(cast);
    })?.toList();

    return ListCastTvMaze(listCasts);
  }

}