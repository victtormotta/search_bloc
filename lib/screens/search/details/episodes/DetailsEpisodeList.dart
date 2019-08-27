import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tvmaze_search_bloc/blocs/SearchEpisodeBloc.dart';
import 'package:tvmaze_search_bloc/component/tiles/search/details/tvshow/PosterFullSize.dart';
import 'package:tvmaze_search_bloc/component/transition/FadeRoute.dart';
import 'package:tvmaze_search_bloc/model/episode/Episode.dart';
import 'package:tvmaze_search_bloc/model/episode/list/ListEpisode.dart';
import 'package:tvmaze_search_bloc/component/tiles/search/details/tvshow/episodes/CardEpisodes.dart';
import 'package:tvmaze_search_bloc/constants/Constants.dart' as Constants;

class DetailsEpisodeList extends StatefulWidget {
  DetailsEpisodeList({Key key, this.id, this.seasonNumber}) : super(key: key);

  final String id;
  final String seasonNumber;

  @override
  _DetailsEpisodeListState createState() => _DetailsEpisodeListState();
}

class _DetailsEpisodeListState extends State<DetailsEpisodeList> {


  @override
  Widget build(BuildContext context) {
    print('DetailsEpisodeList redraw');

    final SearchEpisodeBloc searchEpisodeBloc = new SearchEpisodeBloc(widget.seasonNumber);
    searchEpisodeBloc.searchEvent.add(widget.id);

    return StreamBuilder<ListEpisode>(
        stream: searchEpisodeBloc.apiResultFlux,
        builder:
            (BuildContext context, AsyncSnapshot<ListEpisode> snapshot) {
          return snapshot.hasData
              ? CardEpisodes(
              episodesByIndex: snapshot.data.episodes)
              : Container(
              child: Center(
                child: CircularProgressIndicator(),
              ));
        });
  }
}
/*  Widget _cardEpisodes(episodesByIndex){
    return SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          SizedBox(
            height: 200.0,
            child: ListView.builder(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: episodesByIndex.length,
                itemBuilder: (BuildContext context, int index) {
                  final Episode item = episodesByIndex[index];
                  return Card(
                    color: Colors.black26,
                    margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    elevation: 4.0,
                    child: ExpansionTile(
                      title: Text(
                        item.name,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.white),
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
                        onTap: () => Navigator.push(
                            context, FadeRoute(page: PosterFullSize(item.image))),
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
        ]));
  }*//*

}

*/
/*
class DetailsEpisodeList extends StatelessWidget {

  const DetailsEpisodeList({Key key, this.id, this.seasonNumber}): super(key: key);

  final String id;
  final String seasonNumber;

  @override
  Widget build(BuildContext context) {
    print('DetailsEpisode redraw');
    *//*
*/
/* consulta de episodios BLOC *//*
*/
/*
    final SearchEpisodeBloc searchEpisodeBloc = new SearchEpisodeBloc();
    searchEpisodeBloc.searchEvent.add(id);

    return StreamBuilder<ListEpisode>(
        stream: searchEpisodeBloc.apiResultFlux,
        builder:
            (BuildContext context, AsyncSnapshot<ListEpisode> snapshot) {
          return snapshot.hasData
              ? CardEpisodes(searchEpisodeBloc.returnEpisodesBySeason(snapshot.data.episodes, seasonNumber))
              : Container(
              child: Center(
                child: CircularProgressIndicator(),
              ));
        });
  }
}*/

