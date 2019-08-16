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
              _title(size),
              _synopsis(size),
              _cast(size),
              CastTileBloc(searchCastBloc),
            ],
          ),
        ),
      ),
    );
  }

  Widget _image(size) {
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
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => _fullSizeImage(widget.item.image)
                )
            )
        )
      ],
    );
  }

  Widget _fullSizeImage(image){
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

  Widget _title(size) {
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

  Widget _synopsis(size) {
    return Container(
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

  Widget _cast(size) {
    return Container(
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
}
