import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:tvmaze_search_bloc/blocs/LoadBloc.dart';
import 'package:tvmaze_search_bloc/details/DetailsWidget.dart';
import 'package:tvmaze_search_bloc/model/ListFromSearchTvMaze.dart';
import 'package:tvmaze_search_bloc/model/TvShow.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';

class HorizontalSwiper extends StatefulWidget {
  HorizontalSwiper({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HorizontalSwiperBloc createState() => _HorizontalSwiperBloc();
}

class _HorizontalSwiperBloc extends State<HorizontalSwiper> {
  final LoadBloc _loadBloc = new LoadBloc();

  Widget _items(TvShow item, String tag_name) {
    // ROUNDED:
    return Container(
        child: GestureDetector(
          child: Hero(
            tag: tag_name,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18.0),
              child: FadeInImage(
                image: NetworkImage(item.image),
                fit: BoxFit.cover,
                placeholder: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwt_P-IiO7iiAGO3n-5nTfhR7JoLJI8wsqO_kGqm9Y4H0qcAijdw"),
              ),
            ),
          ),
          onTap: () => Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => DetailsWidget(item:item,)
              )
          )
          ,
        ),
      );
    // DEFAULT:
//    return new Container(
//        child: GestureDetector(
//            child: Image.network(
//              item.image,
//              fit: BoxFit.fill,
//            ),
//            onTap: () => Navigator.push(
//                context,
//                CupertinoPageRoute(
//                    builder: (context) => DetailsWidget(
//                          item: item,
//                        )))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(title: Text("TvMaze"),
//      ),
      body: ListView(
        children: <Widget>[
          Container(height: 30),
          logoTvMaze(),
//          title(),
          recomendationsFromTvMaze(),
          Container(height: 50),
//          title(),
//          Container(height: 10),
//          genresFromTvMaze(),
        ],
      ),
    );
  }

  Text title() {
    return Text(
      'Recomendations',
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.teal,
      ),
      textAlign: TextAlign.justify,
    );
  }

  Container logoTvMaze() {
    return new Container(
      height: 30,
      child: Image.network(
        "https://static.tvmaze.com/images/tvm-header-logo.png",
        fit: BoxFit.fitHeight,
      ),
    );
  }

  StreamBuilder recomendationsFromTvMaze() {
    return StreamBuilder<ListFromSearchTvMaze>(
        stream: _loadBloc.apiResultFlux,
        builder: (BuildContext context,
            AsyncSnapshot<ListFromSearchTvMaze> snapshot) {
          return snapshot.hasData
              ? Container(
                  height: 480,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      TvShow item = snapshot.data.tvShows[index];
                      String tag_name = item.url + "_recomendations";
                      return _items(item, tag_name);
                    },
                    indicatorLayout: PageIndicatorLayout.COLOR,
                    autoplay: true,
                    itemCount: 5,
                    pagination: SwiperPagination(),
                    containerHeight: 0.9,
                    itemWidth: 480,
                    itemHeight: 480,
                    layout: SwiperLayout.TINDER,
                  ))
              : Container(height: 500, child: Center(
            child: CircularProgressIndicator(),
          ));
        });
  }

  StreamBuilder genresFromTvMaze() {
    return StreamBuilder<ListFromSearchTvMaze>(
        stream: _loadBloc.apiResultFlux,
        builder: (BuildContext context,
            AsyncSnapshot<ListFromSearchTvMaze> snapshot) {
          return snapshot.hasData
              ? Container(
                  height: 150,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      TvShow item = snapshot.data.tvShows[index];
                      String tag_name = item.url + "_genres";
                      return _items(item, tag_name);
                    },
                    indicatorLayout: PageIndicatorLayout.COLOR,
                    autoplay: true,
                    itemCount: 5,
                    control: SwiperControl(),
                    containerHeight: 0.9,
                    itemWidth: 100,
                    itemHeight: 150,
                    layout: SwiperLayout.STACK,
                  ))
              : Center(
                  child: CircularProgressIndicator(),
                );
        });
  }
}
