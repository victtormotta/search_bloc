import '../model/TvShow.dart';

class ListFromSearchTvMaze {
  final List<TvShow> tvShows;

  ListFromSearchTvMaze(this.tvShows);

  factory ListFromSearchTvMaze.fromJson(List<dynamic> json) {
    json.shuffle();
    json = json.sublist(0, 5);

    // pega o campo artists do json, cast como uma lista e converte cada item da lista;
    final listShows = json?.map((show) {
      return TvShow.fromJson(show);
    })?.toList();

    return ListFromSearchTvMaze(listShows);
  }

}