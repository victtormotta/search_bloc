/*
class Album {
  */
/*
  Classe que representa cada item da pesquisa;
 *//*

  final String name;
  final String style;
  final String thumb;
  final String logo;
  final String biography;
  final String topChart;

  Album({this.name, this.style, this.thumb, this.logo, this.biography, this.topChart});
  // construtor de fábrica que recebe um mapa de string dinânico e retorna um objeto
  // da mesma classe;
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        name: json["strArtist"] as String,
        style: json["strStyle"] as String,
        thumb: json["strArtistThumb"] as String,
        logo: json["strArtistLogo"] as String,
        biography: json["strBiographyPT"] as String,
        topChart: json["strLastFMChart"] as String
    );
  }
}
*/
