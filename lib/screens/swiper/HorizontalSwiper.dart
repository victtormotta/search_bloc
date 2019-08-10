import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:tvmaze_search_bloc/blocs/LoadBloc.dart';
import 'package:tvmaze_search_bloc/model/ListFromSearchTvMaze.dart';
import 'package:tvmaze_search_bloc/model/TvShow.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:tvmaze_search_bloc/screens/TvShowDetailPage.dart';

class HorizontalSwiper extends StatelessWidget {

  final LoadBloc _loadBloc = new LoadBloc();

  Widget _items(TvShow item) {
    return ListTile(
      leading: Container(
        child: GestureDetector(
          child: Hero(
            tag: item.status,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: FadeInImage(
                image: NetworkImage(item.image),
                fit: BoxFit.cover,
                placeholder: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTB7suUSfqcNx7SVHZoskbX1LoDsx_XC7A789qGRl4F-1eDYq5f"),
              ),
            ),
          ),
        ),
      ),
    );
    // DEFAULT:
//    return new Image.network(item.image,
//      fit: BoxFit.fill,
//    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text("TvMaze"),
//      ),
      body: ListView(
        children: <Widget>[
          // StreamBuilder -> widget que é capaz de modificar o estado dele ouvind um fluxo de dados
          recomendationsFromTvMaze(),
          Container(height: 80),
          title(),
//          genresFromTvMaze(),
        ],
      ),
    );
  }

  Text title(){
    return Text(
      'Recomendations',
      style: TextStyle(fontSize: 15, color: Colors.yellowAccent,),
      textAlign: TextAlign.start,
    );
  }

  Container logoTvMaze(){
    return new Container(
      height: 60,
     child:
     Image.network(
       "https://static.tvmaze.com/images/tvm-header-logo.png",
       fit: BoxFit.fitHeight,
     ),
    );
  }

  StreamBuilder recomendationsFromTvMaze(){
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
                  return _items(item);
                },
                indicatorLayout: PageIndicatorLayout.COLOR,
                autoplay: true,
                itemCount: 5,
                pagination: SwiperPagination(),
                control: SwiperControl(),
                containerHeight: 0.9,
                itemWidth: 480,
                itemHeight: 480,
                layout: SwiperLayout.TINDER,
              ))
              : Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  StreamBuilder genresFromTvMaze(){
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
                  return _items(item);
                },
                indicatorLayout: PageIndicatorLayout.COLOR,
                autoplay: true,
                itemCount: 5,
                pagination: SwiperPagination(),
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