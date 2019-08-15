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
              _image(size),
              _title(),
              _synopsis(),
              _cast(),
              CastTileBloc(searchCastBloc),
            ],
          ),
        ),
      ),
    );
  }

  Widget _image(size){
    return Column(
      children: <Widget>[
        Container(height: 10),
        Hero(
          tag: widget.item.url ?? "url",
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: FadeInImage(
              fadeInDuration: Duration(milliseconds: 200),
              image: NetworkImage(widget.item.image),
              //half-size page
              fit: BoxFit.cover,
              height: size.height / 2,
              width: size.width - 20,
              placeholder: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTB7suUSfqcNx7SVHZoskbX1LoDsx_XC7A789qGRl4F-1eDYq5f"),
            ),
          ),
        ),
      ],
    );
  }

  Widget _title(){
    return Column(
      children: <Widget>[
        Container(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text(
                "   " + widget.item.name,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
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
        Container(height: 20),
      ],
    );
  }

  Widget _synopsis(){
    return Column(
      children: <Widget>[
        Container(color: Colors.black45,
          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Center(
            child: Text("Synopsis",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[200],
                  fontSize: 17),
            ),
          ),
        ),
        Container(color: Colors.black45,height: 10,),
        Container(color: Colors.black45,
          padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
          child: Center(
            child: Text(widget.item.summary,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[200],
                  fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }

  Widget _cast(){
    return Column(
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
    );
  }
}
