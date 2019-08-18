import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvmaze_search_bloc/screens/search/details/tvshow/DetailsWidget.dart';
import 'package:tvmaze_search_bloc/tiles/search/TvShowCard.dart';
import 'package:tvmaze_search_bloc/transition/FadeRoute.dart';
import '../model/ListFromSearchTvMaze.dart';
import '../model/TvShow.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  List<TvShow> _tvShowResponse = List<TvShow>();
  String text = "";

  Future<void> _search(String text) async {
    try {
      Response response = await Dio()
          .get("http://api.tvmaze.com/search/shows?q=${text}");

//      Response response = await Dio()
//          .get("http://api.tvmaze.com/shows");

      List<TvShow> searchedItems =
          ListFromSearchTvMaze
              .fromJson(response.data)
              .tvShows;

      setState(() {
        _tvShowResponse = searchedItems;
      });
    } on DioError catch (e) {
      print(e);
    }
  }

  Future<void> _timeSearch(String searchText) async {
    if (searchText != text) {
      Timer(Duration(milliseconds: 500), () {
        _search(text);
      });
    }
  }

  Widget _textField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        style: TextStyle(color: Colors.white70),
        onChanged: (value) {
          if (value.length > 2) {
            _timeSearch(value);
            text = value;
          }
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Tv Show name...",
            hintStyle: TextStyle(color: Colors.white30),
            labelText: "Search"),
      ),
    );
  }

  Widget _items(TvShow item) {
    return ListTile(
      leading: Hero(
        tag: item.url ?? "url",
        child: CircleAvatar(
          backgroundImage: NetworkImage(item?.image ??
              "https://d2v9y0dukr6mq2.cloudfront.net/video/thumbnail/VCHXZQKsxil3lhgr4/animation-loading-circle-icon-on-white-background-with-alpha-channel-4k-video_sjujffkcde_thumbnail-full01.png"),
        ),
      ),
      title: Text(item?.name ?? "title"),
      subtitle: Text(item?.status ?? "status"),
      onTap: () =>
          Navigator.push(
              context,
              FadeRoute(page: DetailsWidget(item))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text("TV Shows Search"),
//      ),
      body: ListView(
        children: <Widget>[
          _textField(),
          _tvShowResponse.isNotEmpty
              ? GridView.builder(
              scrollDirection: Axis.vertical,
              physics: PageScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                childAspectRatio: 0.65,
              ),
              itemCount: _tvShowResponse.length,
              itemBuilder: (context, index){
                TvShow item = _tvShowResponse[index];
                return TvShowCard(item);
              }
          )
//          ListView.builder(
//            shrinkWrap: true,
//            physics: ClampingScrollPhysics(),
//            itemCount: _tvShowResponse.length,
//            itemBuilder: (BuildContext context, int index) {
//              TvShow item = _tvShowResponse[index];
//              return _items(item);
//            },
//          )
              : Center(
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
