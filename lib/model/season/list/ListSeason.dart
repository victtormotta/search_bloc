import '../Season.dart';

class ListSeason {
  final List<Season> seasons;

  ListSeason(this.seasons);

  factory ListSeason.fromJson(List<dynamic> json) {

    final List<int> jsonNumber = [];

    for(int i = 0; i < json.length; i++){
      jsonNumber.add(json[i]['number'] as int);
    }

    final listSeasons = json?.map((season) {
      return Season.fromJson(season);
    })?.toList();

    return ListSeason(listSeasons);
  }

}