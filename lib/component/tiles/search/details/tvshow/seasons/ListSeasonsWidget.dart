import 'package:flutter/material.dart';
import 'package:tvmaze_search_bloc/model/season/Season.dart';

import 'CardSeasons.dart';

class ListSeasonsWidget extends StatelessWidget {
  final String id;
  final List<Season> seasons;

  ListSeasonsWidget(this.id, this.seasons);

  @override
  Widget build(BuildContext context) {
    print('ListSeasonsWidget redraw');
    return SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          SizedBox(
            height: 300.0,
            child: ListView.builder(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: seasons.length,
                itemBuilder: (BuildContext context, int index) {
                  final Season season = seasons[index];
                  return CardSeasons(id, season.number);
                }),
          ),
          Container(
            height: 20,
          )
        ]));
  }
}
