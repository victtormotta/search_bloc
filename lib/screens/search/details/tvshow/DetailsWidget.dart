import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:tvmaze_search/transition/FadeRoute.dart';
import 'package:tvmaze_search/model/ListCastTvMaze.dart';
import 'package:tvmaze_search/model/Cast.dart';
import '../../../../model/TvShow.dart';
import 'package:flutter/material.dart';

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
  String showId = "";

  @override
  initState(){
    if (widget.item.id != showId) {
      _search(widget.item.id);
      showId = widget.item.id;
    }
  }

  Future<void> _search(String showId) async {
    try {
      Response response =
      await Dio().get("http://api.tvmaze.com/shows/$showId?embed=cast");

      List<Cast> searchedItems = ListCastTvMaze.fromJson(response.data['_embedded']['cast']).casts;

      setState(() {
        _castResponse = searchedItems;
      });
    } on DioError catch (e) {
      print(e);
    }
  }

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
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTB7suUSfqcNx7SVHZoskbX1LoDsx_XC7A789qGRl4F-1eDYq5f"),
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
                    child: Center(
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
                                placeholder: NetworkImage(
                                  "http://theremedyjournal.com/wp-content/uploads/2017/07/wundermag_1920x1080-128x128.jpg",
                                ),
                              ),
                            ),
                          ),
                        )),
                  );
                }),
          ),
        ])
    );
  }

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
              _castResponse.isNotEmpty
                      ? _castResponseTile()
                        : Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ))
            ],
          ),
        ),
      ),
    );
  }
}