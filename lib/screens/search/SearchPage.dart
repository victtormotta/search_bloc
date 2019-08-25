import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvmaze_search/screens/search/details/tvshow/DetailsWidget.dart';
import 'package:tvmaze_search/transition/FadeRoute.dart';
import 'package:tvmaze_search/model/tvshow/list/ListFromSearchTvMaze.dart';
import 'package:tvmaze_search/model/tvshow/TvShow.dart';
import 'package:tvmaze_search/constants/Constants.dart' as Constants;

class SearchPage extends StatefulWidget {
  SearchPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MySearchPageState createState() => _MySearchPageState();
}

class _MySearchPageState extends State<SearchPage> {
  List<TvShow> _tvShowResponse = List<TvShow>();
  String text = "";

  Future<void> _search(String text) async {
    try {
      //http://api.tvmaze.com/search/shows?q=
      Response response =
          await Dio().get(Constants.URL_SEARCH(text));

      List<TvShow> searchedItems = ListFromSearchTvMaze.fromJson(response.data).tvShows;

      setState(() {
        _tvShowResponse = searchedItems;
      });
    } on DioError catch (e) {
      print(e);
    }
  }

  Future<void> _timeSearch(String searchText) async {
    if (searchText != text) {
      Timer(Duration(milliseconds: 600), () {
        _search(text);
      });
    }
  }

  Widget _textField() {
    return Container(
        color: Colors.black26,
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            // cada vez que for digitado algo no textfield, o metodo onchaged ira ser chamado e add o q
            // o usuario digitou no fluxo
            onChanged: (value) {
              if (value.length > 2) {
                _timeSearch(value);
                text = value;
              }
            },
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              border: OutlineInputBorder(),
              hintText: "Tv Show name...",
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
        ));
  }

  Widget _tvShowResponseTile(){
    return GridView.builder(
        scrollDirection: Axis.vertical,
        physics: PageScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.all(5.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 2.0,
          crossAxisSpacing: 2.0,
          childAspectRatio: 0.64,
        ),
        itemCount: _tvShowResponse.length,
        itemBuilder: (context, index) {
          TvShow item = _tvShowResponse[index];
          return _tvShowCard(item);
        });
  }

  Widget _tvShowCard(TvShow item) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(FadeRoute(page: DetailsWidget(item:item)));
      },
      child: Card(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 0.63,
                child: Hero(
                  tag: item.url,
                  transitionOnUserGestures: true,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: FadeInImage(
                      image: NetworkImage(item.image),
                      fit: BoxFit.fill,
                      placeholder: NetworkImage(
                          Constants.PLACEHOLDER_TV_SHOW),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _textField(),
          _tvShowResponse.isNotEmpty
              ? _tvShowResponseTile()
              : Container(height: 500, child: Center(
              child: CircularProgressIndicator(),
            ))
        ],
      ),
    );
  }
}
