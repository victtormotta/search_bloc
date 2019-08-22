import 'package:html/parser.dart';

class TvShow {
  /*
  Classe que representa cada item da pesquisa;
 */
  final String id;
  final String name;
  final String url;
  /* final List genres; */
  final String image;
  final String status;
  final String summary;
  /* final String rating; */
  final String platform;
  final String premiered;

  TvShow({this.id, this.name, this.url, /* this.genres, */ this.image, this.status, this.summary, /* this.rating */ this.platform, this.premiered});
  // construtor de fábrica que recebe um mapa de string dinânico e retorna um objeto
  // da mesma classe;
  factory TvShow.fromJson(Map<String, dynamic> json) {
//    print(json);

    String returnIdValue(json) {
      if(json.containsKey("show")) {
        return json["show"]["id"].toString();
      } else return json["id"].toString();
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
      if(json.containsKey("show")) {
        return json["show"]["url"] != null ?
        json["show"]["url"] as String
            : "url_null";
      } else return json["url"] != null ?
      json["url"] as String
          : "url_null";
    }
    
    String returnImageValue(json) {
      if(json.containsKey("show") && json["show"]["image"] != null) {
        return json["show"]["image"] != null ?
        json["show"]["image"]["original"] as String
            : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwt_P-IiO7iiAGO3n-5nTfhR7JoLJI8wsqO_kGqm9Y4H0qcAijdw";
      } else return json["image"] != null ?
      json["image"]["original"] as String
          : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwt_P-IiO7iiAGO3n-5nTfhR7JoLJI8wsqO_kGqm9Y4H0qcAijdw";
    }

    String returnStatusValue(json) {
      if(json.containsKey("show")) {
        return json["show"]["status"] != null ?
        json["show"]["status"] as String
            : "url_null";
      } else return json["status"] != null ?
      json["status"] as String
          : "status_null";
    }

    /*
    https://stackoverflow.com/questions/51593790/remove-html-tags-from-a-string-in-dart
     */
    String _parseHtmlString(String htmlString) {
      var document = parse(htmlString);
      String parsedString = parse(document.body.text).documentElement.text;
      return parsedString;
    }

    String returnSummaryValue(json) {
      if(json.containsKey("show")) {
        return json["show"]["summary"] != null ?
        _parseHtmlString(json["show"]["summary"] as String)
            : "summary_null";
      } else return json["summary"] != null ?
      _parseHtmlString(json["summary"] as String)
          : "summary_null";
    }

    String returnNetworkValue(json) {
        if(json.containsKey("show") && json["show"]["network"] != null) {
          return json["show"]["network"] != null ?
          json["show"]["network"]["name"] as String
              : "null";
        } else return json["network"] != null ?
        json["network"]["name"] as String
            : "null";
      }

    String returnWebChannelValue(json) {
      if(json.containsKey("show") && json["show"]["webChannel"] != null) {
        return json["show"]["webChannel"] != null ?
        json["show"]["webChannel"]["name"] as String
            : "null";
      } else return json["webChannel"] != null ?
      json["webChannel"]["name"] as String
          : "null";
    }


    String returnPremieredValue(json) {
      if(json.containsKey("show")) {
        return json["show"]["premiered"] != null ?
        json["show"]["premiered"] as String
            : "premiered_null";
      } else return json["premiered"] != null ?
      json["premiered"] as String
          : "premiered_null";
    }

    return TvShow(
        id: returnIdValue(json),
        name: returnNameValue(json),
        url: returnUrlValue(json),
        /* genres: json["genres"] as List, */
        image: returnImageValue(json),
        status: returnStatusValue(json),
        summary: returnSummaryValue(json),
        platform:  returnNetworkValue(json) != "null" ? returnNetworkValue(json) : returnWebChannelValue(json),
        premiered: returnPremieredValue(json).substring(0, 4),
        /* rating: (json["rating"] as Map<String, dynamic>)["average"] as String */
    );
  }
}
