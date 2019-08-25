import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:tvmaze_search/model/tvshow/list/ListFromSearchTvMaze.dart';
import 'package:tvmaze_search/model/tvshow/TvShow.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:tvmaze_search/screens/search/details/tvshow/DetailsWidget.dart';
import 'package:tvmaze_search/transition/FadeRoute.dart';
import 'package:tvmaze_search/constants/Constants.dart' as Constants;

class HorizontalSwiper extends StatefulWidget {
  HorizontalSwiper({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHorizontalSwiper createState() => _MyHorizontalSwiper();
}

class _MyHorizontalSwiper extends State<HorizontalSwiper> {
  List<TvShow> _tvShowResponse = List<TvShow>();

  @override
  initState(){
    String url = Constants.URL_LOAD;
    _search(url);
  }

  Future<void> _search(String url) async {
    try {
      Response response = await Dio().get(url);

      response.data.shuffle();
      response.data = response.data.sublist(0,5);

      List<TvShow> searchedItems = response.data?.map<TvShow>((show) {
        return TvShow.fromJson(show);
      })?.toList();

      setState(() {
        _tvShowResponse = searchedItems;
      });
    } on DioError catch (e) {
      print(e);
    }
  }

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
                    Constants.PLACEHOLDER_TV_SHOW),
              ),
            ),
          ),
          onTap: () => Navigator.push(
              context,
              FadeRoute(page: DetailsWidget(item: item))
          )
          ,
        ),
      );
    // DEFAULT:
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Container(height: 30),
          /*logoTvMaze*/
        Container(
          height: 30,
          child: Image.network(
            Constants.LOGO_TV_MAZE,
            fit: BoxFit.fitHeight,
            ),
          ),
        Container(height: 20),
          /*recomendationsFromTvMaze*/
          _tvShowResponse.isNotEmpty
              ?
            Column(children: <Widget>[
              Container(
                  height: 480,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      TvShow item = _tvShowResponse[index];
                      String tag_name = item.url + "_recomendations";
                      return _items(item, tag_name);
                    },
                    indicatorLayout: PageIndicatorLayout.COLOR,
                    autoplay: true,
                    itemCount: _tvShowResponse.length,
                    pagination: SwiperPagination(),
                    containerHeight: 0.9,
                    itemWidth: size.width/1.25,
                    itemHeight: size.height,
                    layout: SwiperLayout.STACK,
                  )),
              Container(height: 50,),
//              Container(
//                  child: Swiper(
//                    itemBuilder: (BuildContext context, int index) {
//                      TvShow item = _tvShowResponse[index];
//                      String tag_name = item.url + "_recomendations";
//                      return _items(item, tag_name);
//                    },
//                    indicatorLayout: PageIndicatorLayout.COLOR,
//                    autoplay: true,
//                    itemCount: _tvShowResponse.length,
//                    containerHeight: 0.9,
//                    itemWidth: size.width/2,
//                    itemHeight: size.height/4,
//                    layout: SwiperLayout.STACK,
//                  )),
              Container(height: 30,),
            ],)
              : Container(height: 500, child: Center(
            child: CircularProgressIndicator(),
          )),
        ],
      ),
    );
  }
}
