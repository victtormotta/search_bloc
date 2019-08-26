import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tvmaze_search_bloc/blocs/SearchCastBloc.dart';
import 'package:tvmaze_search_bloc/blocs/SearchEpisodeBloc.dart';
import 'package:tvmaze_search_bloc/blocs/SearchSeasonBloc.dart';
import 'package:tvmaze_search_bloc/component/tiles/search/details/tvshow/episodes/TitleEpisodes.dart';
import 'package:tvmaze_search_bloc/model/season/list/ListSeason.dart';
import 'package:tvmaze_search_bloc/model/tvshow/TvShow.dart';
import 'package:tvmaze_search_bloc/screens/search/details/cast/DetailsCastList.dart';
import 'package:tvmaze_search_bloc/component/tiles/search/details/tvshow/Poster.dart';
import 'package:tvmaze_search_bloc/component/tiles/search/details/tvshow/Synopsys.dart';
import 'package:tvmaze_search_bloc/component/tiles/search/details/tvshow/TitleTv.dart';
import 'package:tvmaze_search_bloc/component/tiles/search/details/tvshow/TitleCast.dart';
import 'package:tvmaze_search_bloc/screens/search/details/episodes/DetailsEpisodeList.dart';
import 'package:tvmaze_search_bloc/screens/search/details/seasons/DetailsSeasonList.dart';



class DetailsPage extends StatefulWidget {

  final TvShow item;

  DetailsPage(this.item);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    /*method to get actual size of device*/
    Size size = MediaQuery.of(context).size;

    /*add id of tvshow to be listen on Bloc's Sink*/
    final SearchCastBloc searchCastBloc = SearchCastBloc();
    searchCastBloc.searchEvent.add(widget.item.id);

    final SearchSeasonBloc searchSeasonBloc = SearchSeasonBloc();
    searchSeasonBloc.searchEvent.add(widget.item.id);

    return CupertinoPageScaffold(
      backgroundColor: Colors.white12,
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
                  widget.item.url,
                  widget.item.image),
              TitleTv(size,
                  widget.item.name,
                  widget.item.premiered,
                  widget.item.platform),
              Synopsis(
                  widget.item.summary),
              TitleCast(size),
              DetailsCastList(searchCastBloc),
              TitleEpisodes(size),
              DetailsSeasonList(widget.item.id, searchSeasonBloc),
/*              TitleEpisodes(size),
              DetailsEpisodeList(searchEpisodeBloc),*/
            ],
          ),
        ),
      ),
    );
  }
}



/*
  Class responsible for display tvshow's details; such as synopis, cast, etc;
 */
/*
class DetailsPage extends StatelessWidget {
  final TvShow item;

  DetailsPage(this.item);


  @override
  Widget build(BuildContext context) {
    */
/*method to get actual size of device*//*


    Size size = MediaQuery.of(context).size;

    */
/*add id of tvshow to be listen on Bloc's Sink*//*


    final SearchCastBloc searchCastBloc = SearchCastBloc();
    searchCastBloc.searchEvent.add(item.id);

    final SearchSeasonBloc searchSeasonBloc = SearchSeasonBloc();
    searchSeasonBloc.searchEvent.add(item.id);

    final SearchEpisodeBloc searchEpisodeBloc = new SearchEpisodeBloc();
    searchEpisodeBloc.searchEvent.add(item.id);

    return CupertinoPageScaffold(
      backgroundColor: Colors.white12,
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
              */
/*separation of items to be displayed on widgets*//*

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
              TitleCast(size),
              DetailsCastList(searchCastBloc),
              TitleEpisodes(size),
              DetailsSeasonList(item.id, searchSeasonBloc),
*/
/*              TitleEpisodes(size),
              DetailsEpisodeList(searchEpisodeBloc),*//*


            ],
          ),
        ),
      ),
    );
  }
}
*/
