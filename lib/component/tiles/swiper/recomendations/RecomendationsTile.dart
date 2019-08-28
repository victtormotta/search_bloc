import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:tvmaze_search_bloc/model/tvshow/TvShow.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';

import 'RecomendationHero.dart';

class RecomendationsTile extends StatelessWidget {

  final List<TvShow> listTvShows;

  RecomendationsTile(this.listTvShows);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
            height: size.height/2,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                TvShow item = listTvShows[index];
                String tagName = item.url + "_recomendations";
                return RecomendationHero(item, tagName);
              },
              indicatorLayout: PageIndicatorLayout.COLOR,
              autoplay: true,
              itemCount: 5,
              containerHeight: 0.9,
              pagination: SwiperPagination(),
              itemWidth: size.width/1.25,
              itemHeight: size.height,
              layout: SwiperLayout.STACK,
            )
        ),
        Container(
          height: 60,
        ),
        Container(
            height: size.height/8,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                TvShow item = listTvShows[index];
                String tagName = item.url + "_recomendations";
                return RecomendationHero(item, tagName);
              },
              indicatorLayout: PageIndicatorLayout.COLOR,
              autoplay: false,
              itemCount: 5,
              containerHeight: 0.9,
              itemWidth: size.width/8,
              itemHeight: size.height/8,
              layout: SwiperLayout.TINDER,
            )
        ),
        Container(
          height: 60,
        ),
        Container(
            height: size.height/8,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                TvShow item = listTvShows[index];
                String tagName = item.url + "_recomendations";
                return RecomendationHero(item, tagName);
              },
              indicatorLayout: PageIndicatorLayout.COLOR,
              autoplay: false,
              itemCount: 5,
              containerHeight: 0.9,
              itemWidth: size.width/8,
              itemHeight: size.height/8,
              layout: SwiperLayout.DEFAULT,
            )
        ),
      ],
    );
  }
}