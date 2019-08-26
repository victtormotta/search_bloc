import '../PosterFullSize.dart';
import 'package:flutter/material.dart';
import 'package:tvmaze_search_bloc/model/episode/Episode.dart';
import 'package:tvmaze_search_bloc/component/transition/FadeRoute.dart';
import 'package:tvmaze_search_bloc/constants/Constants.dart' as Constants;


class CardEpisodes extends StatefulWidget {
  CardEpisodes({Key key, this.episodesByIndex}) : super(key: key);

  final List<Episode> episodesByIndex;

  @override
  _CardEpisodesState createState() => _CardEpisodesState();
}

class _CardEpisodesState extends State<CardEpisodes> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          SizedBox(
            height: 200.0,
            child: ListView.builder(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: widget.episodesByIndex.length,
                itemBuilder: (BuildContext context, int index) {
                  final Episode item = widget.episodesByIndex[index];
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
  }
}


/*class CardEpisodes extends StatelessWidget {
  final List<Episode> episodesByIndex;

  CardEpisodes(this.episodesByIndex);

  @override
  Widget build(BuildContext context) {
    print('CardEpisodes redraw');
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
  }
}*/
