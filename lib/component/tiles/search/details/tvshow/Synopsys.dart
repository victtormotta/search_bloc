import 'package:flutter/material.dart';

class Synopsis extends StatelessWidget {
  final String summary;

  Synopsis(this.summary);

  @override
  Widget build(BuildContext context) {
    print('synopsis redraw');
    return Container(
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      child: Column(
        children: <Widget>[
          // title 'sumary'
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Center(
              child: Text(
                "Synopsis",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[200],
                    fontSize: 15),
              ),
            ),
          ),
          Container(
            height: 10,
          ),
          // show's sumary
          Container(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
            child: Center(
              child: Text(
                summary,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[200],
                    fontSize: 15),
              ),
            ),
          ),
          Container(
            height: 5,
          ),
        ],
      ),
    );
  }
}