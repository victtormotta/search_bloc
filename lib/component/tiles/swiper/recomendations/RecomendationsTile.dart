import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:tvmaze_search_bloc/model/tvshow/TvShow.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:tvmaze_search_bloc/constants/Constants.dart' as Constants;

import '../../../../screens/search/details/tvshow/DetailsPage.dart';
import '../../../transition/FadeRoute.dart';
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
            height: size.height / 2,
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
              itemWidth: size.width / 1.25,
              itemHeight: size.height,
              layout: SwiperLayout.STACK,
            )),
        Container(
          height: 40,
        ),
        Container(
          width: size.width + 50,
          child: Column(
            children: <Widget>[
              Container(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      "   " + "MOST SEEN",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[200],
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
              Container(height: 10),
            ],
          ),
        ),
        SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          SizedBox(
            height: 170,
            child: ListView.builder(
                padding: EdgeInsets.fromLTRB(8, 5, 8, 5),
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  listTvShows.shuffle();
                  TvShow item = listTvShows[index];

                  return Card(
                      color: Colors.black26,
                      margin:
                          EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
                      elevation: 4.0,
                      child: GestureDetector(
                          child: Hero(
                            tag: DateTime.now(),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: FadeInImage(
                                height: 150,
                                width: 170,
                                image: NetworkImage(item.image),
                                fit: BoxFit.cover,
                                placeholder:
                                    NetworkImage(Constants.PLACEHOLDER_EPISODE),
                              ),
                            ),
                          ),
                          onTap: () => Navigator.push(
                              context, FadeRoute(page: DetailsPage(item)))));
                }),
          ),
          Container(
            height: 20,
          )
        ])),

        Container(
          height: 10,
        ),
        Container(
          width: size.width + 50,
          child: Column(
            children: <Widget>[
              Container(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      "   " + "RECENTLY ADDED",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[200],
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
              Container(height: 10),
            ],
          ),
        ),
        SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              SizedBox(
                height: 170,
                child: ListView.builder(
                    padding: EdgeInsets.fromLTRB(8, 5, 8, 5),
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      listTvShows.shuffle();
                      TvShow item = listTvShows[index];

                      return Card(
                          color: Colors.black26,
                          margin:
                          EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
                          elevation: 4.0,
                          child: GestureDetector(
                              child: Hero(
                                tag: DateTime.now(),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: FadeInImage(
                                    height: 150,
                                    width: 170,
                                    image: NetworkImage(item.image),
                                    fit: BoxFit.cover,
                                    placeholder:
                                    NetworkImage(Constants.PLACEHOLDER_EPISODE),
                                  ),
                                ),
                              ),
                              onTap: () => Navigator.push(
                                  context, FadeRoute(page: DetailsPage(item)))));
                    }),
              ),
              Container(
                height: 20,
              )
            ])),
      ],
    );
  }
}
