import 'package:flutter/material.dart';

class TitleTv extends StatelessWidget {
  final Size size;
  final String name;
  final String premiered;
  final String platform;

  TitleTv(this.size, this.name, this.premiered, this.platform);

  @override
  Widget build(BuildContext context) {
    print('titleTv redraw');
    return Container(
      width: size.width - 30,
      child: Column(
        children: <Widget>[
          Container(
            height: 10,
          ),
          // show's name
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: Container(
                  child: Text(
                    name,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.teal[300],
                        fontSize: 25),
                  ),
                ),
              )
            ],
          ),
          // show's year
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text(
                  premiered,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.w200,
                      color: Colors.grey[200],
                      fontSize: 15),
                ),
              ),
            ],
          ),
          // show's platform
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text(
                  platform,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[200],
                      fontSize: 15),
                ),
              ),
            ],
          ),
          Container(height: 20),
        ],
      ),
    );
  }
}