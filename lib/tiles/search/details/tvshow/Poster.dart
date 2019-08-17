import 'package:flutter/material.dart';

import 'PosterFullSize.dart';

class Poster extends StatelessWidget {
  final Size size;
  final String url;
  final String image;

  Poster(this.size, this.url, this.image);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(height: 10),
        GestureDetector(
            child: Hero(
              tag: url ?? "url",
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: FadeInImage(
                  fadeInDuration: Duration(milliseconds: 200),
                  image: NetworkImage(image),
                  //half-size page
                  fit: BoxFit.cover,
                  height: size.height / 2,
                  width: size.width - 10,
                  placeholder: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTB7suUSfqcNx7SVHZoskbX1LoDsx_XC7A789qGRl4F-1eDYq5f"),
                ),
              ),
            ),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => PosterFullSize(image))))
      ],
    );
  }
}
