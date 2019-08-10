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
      if (json["name"] != null)
        return json["name"] as String;
      else if (json["show"]["name"] != null){
        return json["show"]["name"] as String;
      }
      else
        return "name_null";
    }

    String returnUrlValue(json) {
      if (json["url"] != null)
        return json["url"] as String;
      else if (json["show"]["url"] != null){
        return json["show"]["url"] as String;
      }
      else
        return "url_null";
    }
    
    String returnImageValue(json) {
      if (json["image"] != null)
        return json["image"]["original"] as String;
      else if (json["show"]["image"]["original"] != null){
        return json["show"]["image"]["original"] as String;
      }
      else
        return "https://d2v9y0dukr6mq2.cloudfront.net/video/thumbnail/VCHXZQKsxil3lhgr4/animation-loading-circle-icon-on-white-background-with-alpha-channel-4k-video_sjujffkcde_thumbnail-full01.png";
    }

    String returnStatusValue(json) {
      if (json["status"] != null)
        return json["status"] as String;
      else if (json["show"]["status"] != null){
        return json["show"]["status"] as String;
      }
      else
        return "status_null";
    }

    String returnSummaryValue(json) {
      if (json["summary"] != null)
        return json["summary"] as String;
      else if (json["show"]["summary"] != null){
        return json["show"]["summary"] as String;
      }
      else
        return "summary_null";
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
