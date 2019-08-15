import 'dart:io';
import 'package:dio/dio.dart';
import 'package:tvmaze_search_bloc/model/ListCastTvMaze.dart';
import '../../model/ListFromSearchTvMaze.dart';

class Service{
  // usado para requisição
  final Dio dio = new Dio();
  String _tvMaze = "http://api.tvmaze.com/search/shows";

  Future<ListFromSearchTvMaze> search(String term) async {
    try{
      Response response = await dio.get("$_tvMaze?q=$term");
      return ListFromSearchTvMaze.fromJson(response.data);
    } catch(e){
      throw SocketException(e);
    }
  }

  Future<ListCastTvMaze> searchCast(String showId) async {
    try{
      Response response = await dio.get("http://api.tvmaze.com/shows/$showId?embed=cast");
      return ListCastTvMaze.fromJson(response.data['_embedded']['cast']);
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
