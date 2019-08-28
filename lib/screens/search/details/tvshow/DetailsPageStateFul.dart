import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvmaze_search_bloc/blocs/LoadBloc.dart';
import 'package:tvmaze_search_bloc/blocs/SearchEpisodeBloc.dart';
import 'package:tvmaze_search_bloc/blocs/SearchSeasonBloc.dart';
import 'package:tvmaze_search_bloc/component/tiles/swiper/LogoTvMaze.dart';
import 'package:tvmaze_search_bloc/component/tiles/swiper/recomendations/RecomendationsTile.dart';
import 'package:tvmaze_search_bloc/model/episode/Episode.dart';
import 'package:tvmaze_search_bloc/model/episode/list/ListEpisode.dart';
import 'package:tvmaze_search_bloc/model/season/Season.dart';
import 'package:tvmaze_search_bloc/model/season/list/ListSeason.dart';
import 'package:tvmaze_search_bloc/model/tvshow/TvShow.dart';
import 'package:tvmaze_search_bloc/model/tvshow/list/ListTvShow.dart';
import 'package:tvmaze_search_bloc/constants/Constants.dart' as Constants;

class DetailsPageStateful extends StatefulWidget {
  DetailsPageStateful({Key key, this.item}) : super(key: key);

  final TvShow item;

  @override
  _DetailsPageStatefulBloc createState() => _DetailsPageStatefulBloc();
}

class _DetailsPageStatefulBloc extends State<DetailsPageStateful> {
  // BEGIN BLOC
  SearchSeasonBloc _searchSeasonBloc = new SearchSeasonBloc();
  SearchEpisodeBloc _searchEpisodeBloc;

  // TODO o metodo BLOC no init state ira ser executado uma unica vez antes do componente ser montado;
  @override
  void initState() {
    print('initstate');
    _searchSeasonBloc.searchEvent.add(widget.item.id);
    super.initState();
  }

  @override
  void dispose() {
    _searchSeasonBloc?.dispose();
    _searchEpisodeBloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(height: 70),
          StreamBuilder<ListSeason>(
          stream: _searchSeasonBloc.apiResultFlux,
          builder:
          (BuildContext context, AsyncSnapshot<ListSeason> snapshot) {


            return snapshot.hasData


                ? SingleChildScrollView(
                child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  SizedBox(
                    height: 300.0,
                    child: ListView.builder(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data.seasons.length,
                        itemBuilder: (BuildContext context, int index) {

                          final Season season = snapshot.data.seasons[index];

                          _searchEpisodeBloc = new SearchEpisodeBloc(season.number);

                          _searchEpisodeBloc.searchEvent.add(widget.item.id);

                          return Card(
                            color: Colors.black26,
                            margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                            child: ExpansionTile(
                              title: Text(
                                "SEASON ${season.number}",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, color: Colors.white),
                              ),
                              leading: Icon(Icons.tv, color: Colors.teal,),
                              children: <Widget>[
                                /* get details of episode by season number and episode search */


                            StreamBuilder<ListEpisode>(
                                  stream: _searchEpisodeBloc.apiResultFlux,
                                  builder:
                                      (BuildContext context, AsyncSnapshot<ListEpisode> snapshot) {


                                    return snapshot.hasData

                                        ? SingleChildScrollView(
                                        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                                          SizedBox(
                                            height: 200.0,
                                            child: ListView.builder(
                                                padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                                                physics: BouncingScrollPhysics(),
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: snapshot.data.episodes.length,
                                                itemBuilder: (BuildContext context, int index) {
                                                  final Episode item = snapshot.data.episodes[index];
                                                  return Card(
                                                    color: Colors.black26,
                                                    margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                                    elevation: 4.0,
                                                    child: ExpansionTile(
                                                      title: Text(
                                                        "${index + 1}. ${item.name}",
                                                        textAlign: TextAlign.start,
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.w300, color: Colors.white),
                                                      ),
                                                      leading: GestureDetector(
                                                        child: Hero(
                                                          tag: item.url,
                                                          child: ClipRRect(
                                                            borderRadius: BorderRadius.circular(8.0),
                                                            child: FadeInImage(
                                                              image: NetworkImage(item.image),
                                                              fit: BoxFit.cover,
                                                              placeholder:
                                                              NetworkImage(Constants.PLACEHOLDER_EPISODE),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      children: <Widget>[
                                                        Container(
                                                          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                                                          child: Center(
                                                            child: Text(
                                                              item.summary,
                                                              textAlign: TextAlign.justify,
                                                              style: TextStyle(
                                                                  fontWeight: FontWeight.w500,
                                                                  color: Colors.grey[200],
                                                                  fontSize: 14),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
                                                          child: Text(
                                                            "_______",
                                                            style: TextStyle(
                                                                color: Colors.white70, fontWeight: FontWeight.w500),
                                                          ),
                                                        ),
                                                        Container(
                                                          padding: EdgeInsets.all(0),
                                                          child: Text(
                                                            "On air in ${item.airdate} | ${item.airtime}",
                                                            style: TextStyle(
                                                                color: Colors.white70, fontWeight: FontWeight.w600),
                                                          ),
                                                        ),
                                                        Container(
                                                          padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
                                                          child: Text(
                                                            "${item.runtime} minutes",
                                                            style: TextStyle(
                                                                color: Colors.white70, fontWeight: FontWeight.w600),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }),
                                          ),
                                          Container(
                                            height: 20,
                                          )
                                        ]))


                                        : Container(
                                        height: 50,
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        )

                                      );
                                    }
                                  )



                              ],
                            ),
                          );
                        }),
                  ),
                  Container(
                    height: 20,
                  )
                ]))



                : Container(
                child: Center(
                  child: CircularProgressIndicator(),
                )
            );



          }),
          Container(height: 50),
        ],
      ),
    );
  }
}
