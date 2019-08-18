import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvmaze_search_bloc/screens/search/details/tvshow/DetailsWidget.dart';
import 'package:tvmaze_search_bloc/transition/FadeRoute.dart';
import '../../model/TvShow.dart';

class TvShowCard extends StatelessWidget {

  final TvShow item;

  TvShowCard(this.item);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            FadeRoute(page: DetailsWidget(item)));
      },
      child: Card(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 0.63,
                child: Hero(
                  tag: item.url,
                  transitionOnUserGestures: true,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: FadeInImage(
                      image: NetworkImage(item.image),
                      fit: BoxFit.fill,
                      placeholder: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwt_P-IiO7iiAGO3n-5nTfhR7JoLJI8wsqO_kGqm9Y4H0qcAijdw"),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
