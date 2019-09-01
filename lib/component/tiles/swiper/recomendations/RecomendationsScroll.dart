import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvmaze_search_bloc/component/tiles/details/TitleTile.dart';
import 'package:tvmaze_search_bloc/component/transition/FadeRoute.dart';
import 'package:tvmaze_search_bloc/constants/Constants.dart' as Constants;
import 'package:tvmaze_search_bloc/model/tvshow/TvShow.dart';
import 'package:tvmaze_search_bloc/screens/details/DetailsPage.dart';

class RecomendationsScroll extends StatelessWidget {
  final List<TvShow> listTvShows;
  final Size size;
  final String name;

  RecomendationsScroll(this.listTvShows, this.size, this.name);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          height: 40,
        ),
        Container(
          width: size.width + 50,
          child: TitleTile(size, "$name"),
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