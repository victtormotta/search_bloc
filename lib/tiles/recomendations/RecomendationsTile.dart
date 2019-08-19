import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:tvmaze_search_bloc/model/ListFromSearchTvMaze.dart';
import 'package:tvmaze_search_bloc/model/TvShow.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:tvmaze_search_bloc/screens/search/details/tvshow/DetailsWidget.dart';
import 'package:tvmaze_search_bloc/transition/FadeRoute.dart';


class RecomendationsTile extends StatelessWidget {

  final List<TvShow> listTvShows;

  RecomendationsTile(this.listTvShows);

  Widget _items(TvShow item, String tag_name, BuildContext context) {
    // shuffe list:
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
        onTap: () =>
            Navigator.push(context, FadeRoute(page: DetailsWidget(item))),
      ),
    );
  }

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
                String tag_name = item.url + "_recomendations";
                return _items(item, tag_name, context);
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
//                    Container(
//                      height: 50,
//                    ),
//                    Container(
//                        height: 480,
//                        child: Swiper(
//                          itemBuilder: (BuildContext context, int index) {
//                            TvShow item = snapshot.data.tvShows[index];
//                            String tag_name = item.url + "_recomendations";
//                            return _items(item, tag_name);
//                          },
//                          indicatorLayout: PageIndicatorLayout.COLOR,
//                          autoplay: true,
//                          itemCount: snapshot.data.tvShows.length,
////                    pagination: SwiperPagination(),
//                          containerHeight: 0.9,
//                          itemWidth: size.width / 2,
//                          itemHeight: size.height / 4,
//                          layout: SwiperLayout.STACK,
//                        )),
//                    Container(
//                      height: 30,
//                    ),
      ],
    );
  }
}