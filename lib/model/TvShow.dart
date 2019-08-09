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

    String returnImageValue(json) {
      if (json["show"]["image"] != null)
        return json["show"]["image"]["medium"] as String;
      else
        return "https://d2v9y0dukr6mq2.cloudfront.net/video/thumbnail/VCHXZQKsxil3lhgr4/animation-loading-circle-icon-on-white-background-with-alpha-channel-4k-video_sjujffkcde_thumbnail-full01.png";
    }

    return TvShow(
        name: json["show"]["name"] as String,
        url: json["show"]["url"] as String,
        /* genres: json["genres"] as List, */
        image: returnImageValue(json),
        status: json["show"]["status"] as String,
        summary: json["show"]["summary"] as String,
        /* rating: (json["rating"] as Map<String, dynamic>)["average"] as String */
    );
  }
}
