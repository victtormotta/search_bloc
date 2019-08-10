import 'dart:io';
import 'package:dio/dio.dart';
import '../../model/ListFromSearchTvMaze.dart';

class Service{
  // usado para requisição
  final Dio dio = new Dio();
  String _tvMaze = "http://api.tvmaze.com/search/shows?q=";
  final String _tvMazeAllShows = "http://api.tvmaze.com/singlesearch/shows?q= &embed=episodes";

  Future<ListFromSearchTvMaze> search(String term) async {
    try{
      Response response = await dio.get("$_tvMaze$term");
      return ListFromSearchTvMaze.fromJson(response.data);
    } catch(e){
      throw SocketException(e);
    }
  }

  Future<ListFromSearchTvMaze> load(String url) async {
    try{
      Response response = await dio.get("$url");
      return ListFromSearchTvMaze.fromJson(response.data);
    } catch(e){
      throw SocketException(e);
    }
  }

}