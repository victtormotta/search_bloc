import 'package:tvmaze_search/constants/Constants.dart' as Constants;

class Cast {
  /*
  Classe que representa cada item da pesquisa;
 */
  final String id;
  final String name;
  final String url;
  final String image;

  Cast({this.id, this.name, this.url, this.image});
  // construtor de fábrica que recebe um mapa de string dinânico e retorna um objeto
  // da mesma classe;
  factory Cast.fromJson(Map<String, dynamic> json) {
    print(json);

    String returnIdValue(json) {
      if(json.containsKey("person"))
        return json["person"]["id"].toString();

      return "id_null";
    }

    String returnNameValue(json) {
      if(json.containsKey("person")) {
        return json["person"]["name"] != null ?
        json["person"]["name"] as String
            : "name_null";
      }

      return "name_null";
    }

    String returnUrlValue(json) {
      if(json.containsKey("person")) {
        return json["person"]["url"] != null ?
        json["person"]["url"] as String
            : "url_null";
      }

      return "url_null";
    }

    String returnImageValue(json) {
      if(json.containsKey("person") && json["person"]["image"] != null) {
        return json["person"]["image"] != null ?
        json["person"]["image"]["original"] as String
            : Constants.PLACEHOLDER_CAST;
      }

      return Constants.PLACEHOLDER_CAST;
    }

    return Cast(
      id: returnIdValue(json),
      name: returnNameValue(json),
      url: returnUrlValue(json),
      image: returnImageValue(json),
    );
  }
}
