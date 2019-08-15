import 'package:flutter/material.dart';
import 'package:tvmaze_search_bloc/model/Cast.dart';

class CastCardTile extends StatelessWidget {
  final List<Cast> items;

  CastCardTile(this.items);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        SizedBox(
          height: 180.0,
          child: ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final Cast item = items[index];
                return Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9.0),
                  ),
                  child: Center(
                      child: AspectRatio(
                    aspectRatio: 0.7,
                    child: Hero(
                      tag: item.url,
                      transitionOnUserGestures: true,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: FadeInImage(
                          image: NetworkImage(item.image),
                          fit: BoxFit.fill,
                          placeholder: NetworkImage(
                              "http://theremedyjournal.com/wp-content/uploads/2017/07/wundermag_1920x1080-128x128.jpg",
                              ),
                        ),
                      ),
                    ),
                  )),
                );
              }),
        ),
      ]),
    );
  }
}
