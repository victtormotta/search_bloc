class Season {

  final String idSeason;
  final String number;
  final String url;

  Season({this.idSeason, this.number, this.url});

  factory Season.fromJson(Map<String, dynamic> json) {

    String returnIdSeasonValue(json) {
      return json["id"].toString();
    }

    String returnNumberValue(json) {
      return json["number"] != null ? json["number"].toString() : "number_null";
    }

    String returnUrlValue(json) {
      return json["url"] != null ?
      json["url"] as String
          : "url_null";
    }

    return Season(
      idSeason: returnIdSeasonValue(json),
      number: returnNumberValue(json),
      url: returnUrlValue(json),
    );
  }

}