import 'package:flutter/cupertino.dart';
import 'package:tvmaze_search_bloc/blocs/SearchBloc.dart';
import 'package:tvmaze_search_bloc/blocs/SearchCastBloc.dart';
import 'package:tvmaze_search_bloc/tiles/cast/CastTileBloc.dart';

import '../model/TvShow.dart';
import 'package:flutter/material.dart';

class DetailsWidget extends StatefulWidget {
  final TvShow item;

  const DetailsWidget({Key key, this.item}) : super(key: key);

  @override
  _DetailsWidgetState createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final SearchCastBloc searchCastBloc = SearchCastBloc();
    searchCastBloc.searchEvent.add(widget.item.id);

    return CupertinoPageScaffold(
      backgroundColor: Colors.white12,
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: "Back",
        backgroundColor: Colors.grey[800],
      ),
      child: SingleChildScrollView(
        child: Container(
          width: size.width,
//          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
//              Stack(
//                children: [
              Container(height: 10),
              Hero(
                tag: widget.item.url ?? "url",
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: FadeInImage(
                    fadeInDuration: Duration(milliseconds: 200),
                    image: NetworkImage(widget.item.image),
                    //full-size page
/*                        fit: BoxFit.cover,
                        height: size.height/2 + 100,
                        width: size.width,*/
                    //half-size page
                    fit: BoxFit.cover,
                    height: size.height / 2,
                    width: size.width - 20,
                    placeholder: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTB7suUSfqcNx7SVHZoskbX1LoDsx_XC7A789qGRl4F-1eDYq5f"),
                  ),
                ),
              ),
              Container(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      "   " + widget.item.name,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.teal[300],
                          fontSize: 25),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      "      " + widget.item.premiered,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.w200,
                          color: Colors.grey[200],
                          fontSize: 15),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      "      " + widget.item.platform,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[200],
                          fontSize: 15),
                    ),
                  ),
                ],
              ),
              Container(height: 30),
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
              CastTileBloc(searchCastBloc),

//                  Container(
//                    height: size.height,
//                    width: size.width,
//                    child: Center(
//                        child: Card(
//                      color: Colors.black,
//                      margin:
//                          EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
//                      child: ExpansionTile(
//                        initiallyExpanded: false,
//                        title: Text(
//                          "About",
//                          textAlign: TextAlign.center,
//                          style: TextStyle(
//                              fontWeight: FontWeight.bold,
//                              color: Colors.white),
//                        ),
//                        leading: Icon(
//                          Icons.description,
//                          color: Colors.transparent,
//                        ),
//                        children: <Widget>[
//                          Padding(
//                            padding: EdgeInsets.all(40.0),
//                            child: Text(
//                              widget.item.summary,
//                              style: TextStyle(
//                                  color: Colors.white,
//                                  fontSize: 15,
//                                  fontWeight: FontWeight.w300),
//                            ),
//                          )
//                        ],
//                      ),
//                    )),
//                  ),
//                ],
//              )
            ],
          ),
        ),
      ),
    );
  }
}
