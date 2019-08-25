import 'package:flutter/material.dart';
import 'package:tvmaze_search_bloc/component/tiles/search/details/tvshow/seasons/CardSeasons.dart';
import 'package:tvmaze_search_bloc/model/season/Season.dart';


/*class ListSeasonsWidget extends StatefulWidget {

  final String id;
  final List<Season> seasons;

  ListSeasonsWidget(this.id, this.seasons);

  @override
  _ListSeasonsWidgetState createState() => _ListSeasonsWidgetState();
}

class _ListSeasonsWidgetState extends State<ListSeasonsWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          SizedBox(
            height: 300.0,
            child: ListView.builder(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: widget.seasons.length,
                itemBuilder: (BuildContext context, int index) {
                  final Season season = widget.seasons[index];
                  return CardSeasons(widget.id, season.number);
                }),
          ),
          Container(
            height: 20,
          )
        ]));
  }
}*/


class ListSeasonsWidget extends StatelessWidget {
  final String id;
  final List<Season> seasons;

  ListSeasonsWidget(this.id, this.seasons);

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          SizedBox(
            height: 300.0,
            child: ListView.builder(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
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
