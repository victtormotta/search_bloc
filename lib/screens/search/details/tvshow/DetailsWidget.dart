import 'package:flutter/cupertino.dart';
import 'package:tvmaze_search_bloc/blocs/SearchCastBloc.dart';
import 'package:tvmaze_search_bloc/tiles/search/details/tvshow/Poster.dart';
import 'package:tvmaze_search_bloc/tiles/search/details/tvshow/Synopsys.dart';
import 'package:tvmaze_search_bloc/tiles/search/details/tvshow/TitleCast.dart';
import 'package:tvmaze_search_bloc/tiles/search/details/tvshow/TitleTv.dart';
import '../../../../model/TvShow.dart';
import 'package:flutter/material.dart';
import 'cast/DetailsCastBloc.dart';

/*
  Class responsible for display tvshow's details; such as synopis, cast, etc;
 */
class DetailsWidget extends StatefulWidget {
  final TvShow item;

  const DetailsWidget({Key key, this.item}) : super(key: key);

  @override
  _DetailsWidgetState createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {
  @override
  Widget build(BuildContext context) {
    /*method to get actual size of device*/
    Size size = MediaQuery.of(context).size;
    /*add id of tvshow to be listen on Bloc's Sink*/
    final SearchCastBloc searchCastBloc = SearchCastBloc();
    searchCastBloc.searchEvent.add(widget.item.id);

    return CupertinoPageScaffold(
      backgroundColor: Colors.white12,
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: "Back",
        backgroundColor: Colors.grey[800],
      ),
      child: SingleChildScrollView(
        child: Container(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              /*separation of items to be displayed on widgets*/
              Poster(
                  size,
                  widget.item.url,
                  widget.item.image),
              TitleTv(size,
                  widget.item.name,
                  widget.item.premiered,
                  widget.item.platform),
              Synopsis(
                  widget.item.summary),
              TitleCast(),
              DetailsCastBloc(
                  searchCastBloc),
            ],
          ),
        ),
      ),
    );
  }
}