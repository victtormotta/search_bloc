import 'package:tvmaze_search/model/tvshow/TvShow.dart';
import 'package:tvmaze_search/model/cast/Cast.dart';

class ListCast {
  final List<Cast> casts;

  ListCast(this.casts);

  factory ListCast.fromJson(List<dynamic> json) {
//    print(json["show"]);
    // pega o campo artists do json, cast como uma lista e converte cada item da lista;
    final listCasts = json?.map((cast) {
      return Cast.fromJson(cast);
    })?.toList();

    return ListCast(listCasts);
  }

}