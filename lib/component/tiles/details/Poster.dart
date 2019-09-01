import 'package:flutter/material.dart';
import 'package:tvmaze_search_bloc/component/transition/FadeRoute.dart';
import 'package:tvmaze_search_bloc/constants/Constants.dart' as Constants;
import 'package:tvmaze_search_bloc/component/tiles/details/PosterFullSize.dart';

class Poster extends StatelessWidget {
  final Size size;
  final String url;
  final String image;

  Poster(this.size, this.url, this.image);

  @override
  Widget build(BuildContext context) {
    print('poster redraw');
    return Column(
      children: <Widget>[
//        Container(height: 10),
        GestureDetector(
            child: Hero(
              tag: url ?? "url",
              child: ClipRRect(
                borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(60, 60), bottomRight: Radius.elliptical(60, 60)),
                child: FadeInImage(
                  fadeInDuration: Duration(milliseconds: 200),
                  image: NetworkImage(image),
                  //half-size page
                  fit: BoxFit.cover,
                  height: size.height/2,
                  width: size.width,
                  placeholder: NetworkImage(Constants.PLACEHOLDER_POSTER),
                ),
              ),
            ),
            onTap: () => Navigator.push(context,
                FadeRoute(page: PosterFullSize(image))))
      ],
    );
  }
}
