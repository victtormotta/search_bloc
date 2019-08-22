import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvmaze_search_bloc/blocs/LoadBloc.dart';
import 'package:tvmaze_search_bloc/component/tiles/swiper/LogoTvMaze.dart';
import 'package:tvmaze_search_bloc/component/tiles/swiper/recomendations/RecomendationsTile.dart';
import 'package:tvmaze_search_bloc/model/tvshow/list/ListTvShow.dart';

class HorizontalSwiper extends StatefulWidget {
  HorizontalSwiper({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HorizontalSwiperBloc createState() => _HorizontalSwiperBloc();
}

class _HorizontalSwiperBloc extends State<HorizontalSwiper> {
  // BEGIN BLOC
  LoadBloc _loadBloc = new LoadBloc();

  // TODO o metodo BLOC no init state ira ser executado uma unica vez antes do componente ser montado;
  @override
  void initState() {
    print('initstate');
    _loadBloc.addEventSink();
    super.initState();
  }

  @override
  void dispose() {
    _loadBloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(height: 30),
          /* Image LogoTvMaze */
          LogoTvMaze(),
          Container(height: 20),
          StreamBuilder<ListTvShow>(
            stream: _loadBloc.apiResultFlux,
            builder: (BuildContext context,
                AsyncSnapshot<ListTvShow> snapshot) {
              return snapshot.hasData
                  ? RecomendationsTile(snapshot.data.tvShows)
                  : Container(
                  height: 500,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ));
            }),
          Container(height: 50),
        ],
      ),
    );
  }
}
