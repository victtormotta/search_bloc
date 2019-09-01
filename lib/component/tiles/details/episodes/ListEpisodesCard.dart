import 'package:flutter/material.dart';
import 'package:tvmaze_search_bloc/model/episode/Episode.dart';
import 'package:tvmaze_search_bloc/constants/Constants.dart' as Constants;

class ListEpisodesCard extends StatelessWidget {
  final List<Episode> episodes;

  ListEpisodesCard(this.episodes);

  @override
  Widget build(BuildContext context) {
    print('CardEpisodes redraw');
    return SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      SizedBox(
        height: 200.0,
        child: ListView.builder(
            padding: EdgeInsets.fromLTRB(8, 5, 8, 5),
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: episodes.length,
            itemBuilder: (BuildContext context, int index) {
              final Episode item = episodes[index];
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
    ]));
  }
}
