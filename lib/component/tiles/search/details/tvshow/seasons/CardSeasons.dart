import 'package:flutter/material.dart';
import 'package:tvmaze_search_bloc/screens/search/details/episodes/DetailsEpisodeList.dart';

class CardSeasons extends StatelessWidget {
  final String id;
  final String seasonNumber;

  CardSeasons(this.id, this.seasonNumber);

  @override
  Widget build(BuildContext context) {
    print('CardSeasons redraw');
    return Card(
      color: Colors.black26,
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ExpansionTile(
        title: Text(
          "SEASON $seasonNumber",
          textAlign: TextAlign.start,
          style: TextStyle(
              fontWeight: FontWeight.w500, color: Colors.white),
        ),
        leading: Icon(Icons.tv, color: Colors.teal,),
        children: <Widget>[
          /* get details of episode by season number and episode search */
          DetailsEpisodeList(id, seasonNumber),
        ],
      ),
    );
  }
}

