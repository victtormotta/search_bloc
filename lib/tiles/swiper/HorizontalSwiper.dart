import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvmaze_search_bloc/blocs/LoadBloc.dart';
import 'package:tvmaze_search_bloc/model/ListFromSearchTvMaze.dart';
import 'package:tvmaze_search_bloc/tiles/recomendations/RecomendationsTile.dart';

class HorizontalSwiper extends StatefulWidget {
  HorizontalSwiper({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HorizontalSwiperBloc createState() => _HorizontalSwiperBloc();
}

class _HorizontalSwiperBloc extends State<HorizontalSwiper> {
  final LoadBloc _loadBloc = new LoadBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(height: 30),
          _logoTvMaze(),
          Container(height: 20),
          _recomendationsFromTvMaze(),
          Container(height: 50),
        ],
      ),
    );
  }

  Container _logoTvMaze() {
    return new Container(
      height: 30,
      child: Image.network(
        "https://static.tvmaze.com/images/tvm-header-logo.png",
        fit: BoxFit.fitHeight,
      ),
    );
  }

  StreamBuilder _recomendationsFromTvMaze() {

    return StreamBuilder<ListFromSearchTvMaze>(
        stream: _loadBloc.apiResultFlux,
        builder: (BuildContext context,
            AsyncSnapshot<ListFromSearchTvMaze> snapshot) {
          return snapshot.hasData
              ? RecomendationsTile(snapshot.data.tvShows)
              : Container(
                  height: 500,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ));
        });
  }
}
