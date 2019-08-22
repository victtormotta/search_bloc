import 'package:tvmaze_search_bloc/model/tvshow/TvShow.dart';

class ListTvShow {
  final List<TvShow> tvShows;

  ListTvShow(this.tvShows);

  factory ListTvShow.fromJson(List<dynamic> json) {
    json.shuffle();
    json = json.sublist(0, 5);

    // pega o campo artists do json, cast como uma lista e converte cada item da lista;
    final listShows = json?.map((show) {
      return TvShow.fromJson(show);
    })?.toList();

    return ListTvShow(listShows);
  }

}