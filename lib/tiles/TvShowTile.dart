import 'package:flutter/material.dart';
import 'package:tvmaze_search_bloc/details/DetailsWidget.dart';
import 'package:tvmaze_search_bloc/model/TvShow.dart';

class TvShowTile extends StatelessWidget {

  final TvShow item;

  TvShowTile(this.item);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>DetailsWidget(item: item))
        );
      },
      child:  Card(
        color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
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
                    borderRadius: BorderRadius.circular(18.0),
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
          )
      ),
    );
  }
}