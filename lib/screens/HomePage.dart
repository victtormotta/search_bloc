import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvshow_search_bloc/model/ListFromSearchTvMaze.dart';
import 'package:tvshow_search_bloc/model/TvShow.dart';
import 'package:tvshow_search_bloc/details/DetailsWidget.dart';

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
        onChanged: (value) {
          if (value.length > 2) {
            _timeSearch(value);
            text = value;
          }
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Tv Show name...",
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
              CupertinoPageRoute(
                  builder: (context) =>
                      DetailsWidget(
                        item: item,
                      ))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Github Search"),
      ),
      body: ListView(
        children: <Widget>[
          _textField(),
          _tvShowResponse.isNotEmpty
              ? ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: _tvShowResponse.length,
            itemBuilder: (BuildContext context, int index) {
              TvShow item = _tvShowResponse[index];
              return _items(item);
            },
          )
              : Center(
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}