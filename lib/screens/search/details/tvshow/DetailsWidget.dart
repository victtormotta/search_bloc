import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:tvmaze_search/model/episode/Episode.dart';
import 'package:tvmaze_search/model/episode/list/ListEpisode.dart';
import 'package:tvmaze_search/model/season/Season.dart';
import 'package:tvmaze_search/model/season/list/ListSeason.dart';
import 'package:tvmaze_search/transition/FadeRoute.dart';
import 'package:tvmaze_search/model/cast/list/ListCastTvMaze.dart';
import 'package:tvmaze_search/model/cast/Cast.dart';
import 'package:tvmaze_search/model/tvshow/TvShow.dart';
import 'package:flutter/material.dart';
import 'package:tvmaze_search/constants/Constants.dart' as Constants;

/*
  Class responsible for display tvshow's details; such as synopis, cast, etc;
 */

class DetailsWidget extends StatefulWidget {
  DetailsWidget({Key key, this.item}) : super(key: key);

  final TvShow item;

  @override
  _MyDetailsWidgetState createState() => _MyDetailsWidgetState();
}

class _MyDetailsWidgetState extends State<DetailsWidget> {

  List<Cast> _castResponse = List<Cast>();
  List<Episode> _episodesResponse = List<Episode>();
  List<Season> _seasonsResponse = List<Season>();

  String showId = "";

  @override
  initState(){
    if (widget.item.id != showId) {
      _search(widget.item.id);
      _searchSeasons(widget.item.id);
      showId = widget.item.id;
    }
  }

  /* BEGIN SEARCH */

  Future<void> _search(String showId) async {
    try {
      Response response =
      await Dio().get(Constants.URL_SEARCH_CAST(showId));

      List<Cast> searchedItems = ListCastTvMaze.fromJson(response.data['_embedded']['cast']).casts;

      setState(() {
        _castResponse = searchedItems;
      });
    } on DioError catch (e) {
      print(e);
    }
  }


  Future<void> _searchEpisodes(String showId) async {
    try {
      Response response =
      await Dio().get(Constants.URL_EPISODES(showId));

      List<Episode> searchedItems = ListEpisode.fromJson(response.data).episodes;

      setState(() {
        _episodesResponse = searchedItems;
      });
    } on DioError catch (e) {
      print(e);
    }
  }

  Future<void> _searchSeasons(String showId) async {
    try {
      Response response =
      await Dio().get(Constants.URL_SEASONS(showId));

      List<Season> searchedItems = ListSeason.fromJson(response.data).seasons;

      setState(() {
        _seasonsResponse = searchedItems;
      });
    } on DioError catch (e) {
      print(e);
    }
  }

  /* END SEARCH */

  @override
  Widget build(BuildContext context) {
    /*method to get actual size of device*/
    Size size = MediaQuery.of(context).size;

    return CupertinoPageScaffold(
      backgroundColor: Colors.white12,
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: "Back",
        backgroundColor: Colors.grey[800],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Container(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              /*Poster and PosterFullSize*/
              _poster(size),
              /*TitleTv*/
              _titleTv(size),
              /*Synopsis*/
              _synopsis(size),
              /*TitleCast*/
              _titleCast(size),
              /*cast response from search*/
              _castResponse.isNotEmpty
                      ? _castResponseTile()
                        : Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        )),
              /*TitleEpisodes*/
              _titleEpisodes(size),
              /*episode response from search*/
              _seasonsResponse.isNotEmpty
                     ? _episodesResponseTile( _seasonsResponse)
                        : Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  /*POSTER WIDGET */
  Widget _poster(size){
    print('poster redraw');
    return Column(
      children: <Widget>[
        Container(height: 10),
        GestureDetector(
            child: Hero(
              tag: widget.item.url ?? "url",
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: FadeInImage(
                  fadeInDuration: Duration(milliseconds: 200),
                  image: NetworkImage(widget.item.image),
                  //half-size page
                  fit: BoxFit.cover,
                  height: size.height / 2,
                  width: size.width - 10,
                  placeholder: NetworkImage(
                      Constants.PLACEHOLDER_TV_SHOW),
                ),
              ),
            ),
            onTap: () => Navigator.push(context,
                FadeRoute(page: Scaffold(
                  body: GestureDetector(
                    child: Center(
                      child: Hero(
                        tag: 'imageHero',
                        child: Image.network(widget.item.image),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ))))
      ],
    );
  }
  Widget _posterFullSize(image){
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Image.network(image),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
  /*TITLETV WIDGET */
  Widget _titleTv(size){
    print('titleTv redraw');
    return Container(
      width: size.width - 30,
      child: Column(
        children: <Widget>[
          Container(
            height: 10,
          ),
          // show's name
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: Container(
                  child: Text(
                    widget.item.name,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.teal[300],
                        fontSize: 25),
                  ),
                ),
              )
            ],
          ),
          // show's year
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text(
                  widget.item.premiered,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.w200,
                      color: Colors.grey[200],
                      fontSize: 15),
                ),
              ),
            ],
          ),
          // show's platform
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text(
                  widget.item.platform,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[200],
                      fontSize: 15),
                ),
              ),
            ],
          ),
          Container(height: 20),
        ],
      ),
    );
  }
  /* SYNOPSIS WIDGET */
  Widget _synopsis(size){
    print('synopsis redraw');
    return Container(
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      child: Column(
        children: <Widget>[
          // title 'sumary'
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Center(
              child: Text(
                "Synopsis",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[200],
                    fontSize: 15),
              ),
            ),
          ),
          Container(
            height: 10,
          ),
          // show's sumary
          Container(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
            child: Center(
              child: Text(
                widget.item.summary,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[200],
                    fontSize: 15),
              ),
            ),
          ),
          Container(
            height: 5,
          ),
        ],
      ),
    );
  }
  /* CAST WIDGET */
  Widget _titleCast(size){
    print('titleCast redraw');
    return Container(
      width: size.width + 50,
      child: Column(
        children: <Widget>[
          Container(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text(
                  "   " + "CAST",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[200],
                      fontSize: 25),
                ),
              ),
            ],
          ),
          Container(height: 10),
        ],
      ),
    );
  }
  Widget _castResponseTile(){
    print('castResponseTile redraw');
    return SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          SizedBox(
            height: 180.0,
            child: ListView.builder(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: _castResponse.length,
                itemBuilder: (BuildContext context, int index) {
                  final Cast item = _castResponse[index];
                  return Card(
                    color: Colors.white12,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9.0),
                    ),
                    child: Stack(
                      children: <Widget>[

                        Center(
                            child: AspectRatio(
                              aspectRatio: 0.7,
                              child: Hero(
                                tag: item.url,
                                transitionOnUserGestures: true,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: FadeInImage(
                                    image: NetworkImage(item.image),
                                    fit: BoxFit.fill,
                                    placeholder: NetworkImage(Constants.PLACEHOLDER_CAST),
                                  ),
                                ),
                              ),
                            )),

                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                            elevation: 6.0,
                            color: Colors.grey[900],
                            child: Text(
                              " ${item.name}",
                              style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )


                      ],
                    ),
                  );
                }),
          ),
        ])
    );
  }
  /* EPISODES WIDGET */
  Widget _titleEpisodes(Size size){
    return Container(
      width: size.width + 50,
      child: Column(
        children: <Widget>[
          Container(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text(
                  "   " + "EPISODES",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[200],
                      fontSize: 25),
                ),
              ),
            ],
          ),
          Container(height: 10),
        ],
      ),
    );
  }
  Widget _episodesResponseTile(List<Season> seasons){
    print('episodesResponseTile redraw');

    return SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          SizedBox(
            height: 300.0,
            child: ListView.builder(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: seasons.length,
                itemBuilder: (BuildContext context, int index) {
                  // criando index das seasons
                  final int seasonNumber = index + 1;

                  final episodesByIndex = [];

                  _searchEpisodes(widget.item.id);

                  // percorre a lista, se nao tiver na indexSeason, remove o episode
                  for(Episode episode in _episodesResponse){
                    if(int.parse(episode.season) == seasonNumber)
                      episodesByIndex.add(episode);
                  }

                  return Card(
                      color: Colors.black26,
                      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                      child: ExpansionTile(

                        title: Text(
                          "SEASON $seasonNumber",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                        leading: Icon(Icons.tv, color: Colors.teal,),
                        children: <Widget>[
                          _returnCardEpisode(episodesByIndex),
                        ],

                      ),
                    );

                }),
          ),
          Container(
            height: 20,
          )
        ]));
  }
  Widget _returnCardEpisode(episodesByIndex){

    return SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          SizedBox(
            height: 200.0,
            child: ListView.builder(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: episodesByIndex.length,
                itemBuilder: (BuildContext context, int index) {
                  final Episode item = episodesByIndex[index];
                  return
                    Card(
                      color: Colors.black26,
                      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                      elevation: 4.0,
                      /*EXPASIONTILE EPISODES */
                      child: ExpansionTile(
                        /*EPISODE NAME */
                        title: Text(
                          item.name,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                        /*EPISODE IMAGE */
                        leading: GestureDetector(
                          child: Hero(
                            tag: item.url,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: FadeInImage(
                                image: NetworkImage(item.image),
                                fit: BoxFit.cover,
                                placeholder:
                                NetworkImage(Constants.PLACEHOLDER_EPISODE),
                              ),
                            ),
                          ),
                          onTap: () => Navigator.push(
                              context, FadeRoute(page: _posterFullSize(item.image))),
                        ),
                        children: <Widget>[
                          /*EPISODE SUMMARY */
                          Container(
                            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                            child: Center(
                              child: Text(
                                item.summary,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[200],
                                    fontSize: 14),
                              ),
                            ),
                          ),
                          /*EPISODE SEPARATOR */
                          Container(
                            padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
                            child: Text(
                              "_______",
                              style: TextStyle(
                                  color: Colors.white70, fontWeight: FontWeight.w500),
                            ),
                          ),
                          /*EPISODE DATE */
                          Container(
                            padding: EdgeInsets.all(0),
                            child: Text(
                              "On air in ${item.airdate} | ${item.airtime}",
                              style: TextStyle(
                                  color: Colors.white70, fontWeight: FontWeight.w600),
                            ),
                          ),
                          /*EPISODE DURATION */
                          Container(
                            padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
                            child: Text(
                              "${item.runtime} minutes",
                              style: TextStyle(
                                  color: Colors.white70, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    );

                }),
          ),
          Container(
            height: 20,
          )
        ]));
  }
}