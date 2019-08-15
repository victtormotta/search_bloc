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
    }

    String returnNameValue(json) {
      if(json.containsKey("person")) {
        return json["person"]["name"] != null ?
        json["person"]["name"] as String
            : "name_null";
      }
    }

    String returnUrlValue(json) {
      if(json.containsKey("person")) {
        return json["person"]["url"] != null ?
        json["person"]["url"] as String
            : "url_null";
      }
    }

    String returnImageValue(json) {
      if(json.containsKey("person") && json["person"]["image"] != null) {
        return json["person"]["image"] != null ?
        json["person"]["image"]["original"] as String
            : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwt_P-IiO7iiAGO3n-5nTfhR7JoLJI8wsqO_kGqm9Y4H0qcAijdw";
      }
    }

    return Cast(
      id: returnIdValue(json),
      name: returnNameValue(json),
      url: returnUrlValue(json),
      image: returnImageValue(json),
    );
  }
}