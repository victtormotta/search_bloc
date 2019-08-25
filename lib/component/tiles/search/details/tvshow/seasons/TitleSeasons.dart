import 'package:flutter/material.dart';

class TitleSeasons extends StatelessWidget {

  final Size size;

  TitleSeasons(this.size);

  @override
  Widget build(BuildContext context) {
    print('TitleSeasons redraw');
    return Container(
      width: size.width + 50,
      child: Column(
        children: <Widget>[
          Container(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text(
                  "   " + "SEASONS",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[200],
                      fontSize: 25),
                ),
              ),
            ],
          ),
          Container(height: 10),
        ],
      ),
    );
  }
}
