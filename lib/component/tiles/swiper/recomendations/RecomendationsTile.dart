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
            height: 480,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                TvShow item = listTvShows[index];
                String tagName = item.url + "_recomendations";
                return RecomendationHero(item, tagName);
              },
              indicatorLayout: PageIndicatorLayout.COLOR,
              autoplay: true,
              itemCount: listTvShows.length,
              containerHeight: 0.9,
              pagination: SwiperPagination(),
              itemWidth: size.width/2 + 70,
              itemHeight: size.height - 20,
              layout: SwiperLayout.STACK,
            )),
      ],
    );
  }
}