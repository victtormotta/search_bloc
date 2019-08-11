class TvShow {
  /*
  Classe que representa cada item da pesquisa;
 */
  final String name;
  final String url;
  /* final List genres; */
  final String image;
  final String status;
  final String summary;
  /* final String rating; */

  TvShow({this.name, this.url, /* this.genres, */ this.image, this.status, this.summary, /* this.rating */});
  // construtor de fábrica que recebe um mapa de string dinânico e retorna um objeto
  // da mesma classe;
  factory TvShow.fromJson(Map<String, dynamic> json) {
    print(json);

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

    String returnSummaryValue(json) {
      if(json.containsKey("show")) {
        return json["show"]["summary"] != null ?
        json["show"]["summary"] as String
            : "summary_null";
      } else return json["summary"] != null ?
      json["summary"] as String
          : "summary_null";
    }

    return TvShow(
        name: returnNameValue(json),
        url: returnUrlValue(json),
        /* genres: json["genres"] as List, */
        image: returnImageValue(json),
        status: returnStatusValue(json),
        summary: returnSummaryValue(json),
        /* rating: (json["rating"] as Map<String, dynamic>)["average"] as String */
    );
  }
}
