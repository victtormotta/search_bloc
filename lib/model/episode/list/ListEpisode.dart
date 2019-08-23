import '../Episode.dart';

class ListEpisode {
  final List<Episode> episodes;

  ListEpisode(this.episodes);

  factory ListEpisode.fromJson(List<dynamic> json) {
    final listEpisodes = json?.map((episode) {
      return Episode.fromJson(episode);
    })?.toList();

    return ListEpisode(listEpisodes);
  }

}