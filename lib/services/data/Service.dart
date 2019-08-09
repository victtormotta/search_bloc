import 'dart:io';
import 'package:dio/dio.dart';
import 'package:tvshow_search_bloc/model/ListFromSearchTvMaze.dart';

class Service{
  // usado para requisição
  final Dio dio = new Dio();
  String _tvMaze = "http://api.tvmaze.com/search/shows?q=";

  Future<ListFromSearchTvMaze> search(String term) async {
    try{
      Response response = await dio.get("$_tvMaze$term");
      return ListFromSearchTvMaze.fromJson(response.data);
    } catch(e){
      throw SocketException(e);
    }
  }

}