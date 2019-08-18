import 'package:flutter/material.dart';

class TitleCast extends StatelessWidget {

  final Size size;

  TitleCast(this.size);

  @override
  Widget build(BuildContext context) {

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
                  "   " + "CAST",
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
