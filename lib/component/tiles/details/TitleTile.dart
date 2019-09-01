import 'package:flutter/material.dart';

class TitleTile extends StatelessWidget {

  final Size size;
  final String name;

  TitleTile(this.size, this.name);

  @override
  Widget build(BuildContext context) {
    print('TitleTile $name redraw');
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
                  "   " + "$name",
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
