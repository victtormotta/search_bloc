import 'dart:io';
import 'package:dio/dio.dart';
import 'package:tvmaze_search_bloc/constants/Constants.dart' as Constants;
import 'package:tvmaze_search_bloc/model/episode/list/ListEpisode.dart';
import 'package:tvmaze_search_bloc/model/season/list/ListSeason.dart';
import 'package:tvmaze_search_bloc/model/tvshow/list/ListTvShow.dart';
import 'package:tvmaze_search_bloc/model/cast/list/ListCast.dart';

class Service{
  // usado para requisição
  final Dio dio = new Dio();

  Future<ListTvShow> search(String term) async {
    try{
      Response response = await dio.get("${Constants.URL_SEARCH(term)}");
      return ListTvShow.fromJson(response.data);
    } catch(e){
      throw SocketException(e);
    }
  }

  Future<ListCast> searchCast(String showId) async {
    try{
      Response response = await dio.get("${Constants.URL_SEARCH_CAST(showId)}");
      return ListCast.fromJson(response.data['_embedded']['cast']);
    } catch(e){
      throw SocketException(e);
    }
  }

  Future<ListEpisode> searchEpisodes(String showId) async {
    try{
      Response response = await dio.get("${Constants.URL_EPISODES(showId)}");
      return ListEpisode.fromJson(response.data);
    } catch(e){
      throw SocketException(e);
    }
  }

  Future<ListSeason> searchSeasons(String showId) async {
    try{
      Response response = await dio.get("${Constants.URL_SEASONS(showId)}");
      return ListSeason.fromJson(response.data);
    } catch(e){
      throw SocketException(e);
    }
  }

  Future<ListTvShow> load(String url) async {
    try{
      Response response = await dio.get("$url");
      return ListTvShow.fromJson(response.data);
    } catch(e){
      throw SocketException(e);
    }
  }

}
