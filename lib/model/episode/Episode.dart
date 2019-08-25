import 'package:html/parser.dart';
import 'package:tvmaze_search/constants/Constants.dart' as Constants;

class Episode {

  final String idEpisode;
  final String season;
  final String number;
  final String airdate;
  final String airtime;
  final String runtime;

  final String image;
  final String url;
  final String name;
  final String summary;

  Episode({this.idEpisode, this.season, this.number, this.airdate, this.airtime, this.runtime, this.image, this.url, this.name, this.summary});

  factory Episode.fromJson(Map<String, dynamic> json) {

    String returnidEpisodeValue(json) {
      return json["id"].toString();
    }

    String returnSeasonValue(json) {
      return json["season"] != null ? json["season"].toString() : "season_null";
    }

    String returnNumberValue(json) {
      return json["number"] != null ? json["number"].toString() : "number_null";
    }

    String returnAirdateValue(json) {
      return json["airdate"] != null ? json["airdate"].toString() : "airdate_null";
    }

    String returnAirtimeValue(json) {
      return json["airtime"] != null ? json["airtime"].toString() : "airtime_null";
    }

    String returnRuntimeValue(json) {
      return json["runtime"] != null ? json["runtime"].toString() : "runtime_null";
    }

    String returnImageValue(json) {
      return json["image"] != null ?
      json["image"]["original"] as String
          : Constants.PLACEHOLDER_POSTER;
    }

    String returnNameValue(json) {
      if(json.containsKey("show")) {
        return json["show"]["name"] != null ?
        json["show"]["name"] as String
            : "name_null";
      } else return json["name"] != null ?
      json["name"] as String
          : "name_null";
    }

    String returnUrlValue(json) {
      return json["url"] != null ?
      json["url"] as String
          : "url_null";
    }

    /*
    https://stackoverflow.com/questions/51593790/remove-html-tags-from-a-string-in-dart
     */
    String _parseHtmlString(String htmlString) {
      var document = parse(htmlString);
      String parsedString = parse(document.body.text).documentElement.text;
      return parsedString;
    }
    /*
    https://stackoverflow.com/questions/51593790/remove-html-tags-from-a-string-in-dart
     */

    String returnSummaryValue(json) {
      return json["summary"] != null ?
      _parseHtmlString(json["summary"] as String)
          : "summary_null";
    }


    return Episode(
      idEpisode: returnidEpisodeValue(json),
      season: returnSeasonValue(json),
      number: returnNumberValue(json),
      airdate: returnAirdateValue(json),
      airtime: returnAirtimeValue(json),
      runtime: returnRuntimeValue(json),
      name: returnNameValue(json),
      url: returnUrlValue(json),
      image: returnImageValue(json),
      summary: returnSummaryValue(json),

    );
  }

}