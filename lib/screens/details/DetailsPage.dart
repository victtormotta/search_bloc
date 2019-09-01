import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tvmaze_search_bloc/component/tiles/details/TitleTile.dart';
import 'package:tvmaze_search_bloc/model/tvshow/TvShow.dart';
import 'package:tvmaze_search_bloc/screens/details/cast/DetailsCastList.dart';
import 'package:tvmaze_search_bloc/component/tiles/details/Poster.dart';
import 'package:tvmaze_search_bloc/component/tiles/details/Synopsys.dart';
import 'package:tvmaze_search_bloc/component/tiles/details/TitleTv.dart';
import 'package:tvmaze_search_bloc/screens/details/seasons/DetailsSeasonList.dart';

/*
  Class responsible for display tvshow's details; such as synopis, cast, etc;
 */

class DetailsPage extends StatelessWidget {
  final TvShow item;

  DetailsPage(this.item);

  @override
  Widget build(BuildContext context) {

    /*method to get actual size of device*/
    Size size = MediaQuery.of(context).size;

    return CupertinoPageScaffold(
      backgroundColor: Colors.black12,
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: "Back",
        backgroundColor: Colors.grey[800],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Container(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              /*separation of items to be displayed on widgets*/
              Poster(
                  size,
                  item.url,
                  item.image),
              TitleTv(size,
                  item.name,
                  item.premiered,
                  item.platform),
              Synopsis(
                  item.summary),
              TitleTile(size, "CAST"),
              DetailsCastList(
                  item.id),
              TitleTile(size, "EPISODES"),
              DetailsSeasonList(
                  item.id),
            ],
          ),
        ),
      ),
    );
  }
}