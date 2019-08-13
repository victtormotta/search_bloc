import 'package:flutter/cupertino.dart';

import '../model/TvShow.dart';
import 'package:flutter/material.dart';

class DetailsWidget extends StatefulWidget {
  final TvShow item;

  const DetailsWidget({Key key, this.item}) : super(key: key);

  @override
  _DetailsWidgetState createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return CupertinoPageScaffold(
      backgroundColor: Colors.white12,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.black12,
        actionsForegroundColor: Colors.tealAccent,
      ),
      child: SingleChildScrollView(
        child: Container(
          width: size.width,
//          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Stack(
                children: [
                  Hero(
                    tag: widget.item.url ?? "url",
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: FadeInImage(
                        image: NetworkImage(widget.item.image),
                        //full-size page
/*                        fit: BoxFit.cover,
                        height: size.height/2 + 100,
                        width: size.width,*/
                        //half-size page
                        fit: BoxFit.cover,
                        height: size.height/2,
                        width: size.width,
                        placeholder: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTB7suUSfqcNx7SVHZoskbX1LoDsx_XC7A789qGRl4F-1eDYq5f"),
                      ),
                    ),
                  ),
                  Container(
                    height: size.height,
                    width: size.width,
                    child: Center(
                        child: Card(
                      color: Colors.black87,
                      margin:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                      child: ExpansionTile(
//                        initiallyExpanded: true,
                        title: Text(
                          widget.item.name + ' (' + widget.item.premiered + ') ' + ' - ' + widget.item.platform,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.tealAccent),
                        ),
                        leading: Icon(
                          Icons.description,
                          color: Colors.tealAccent,
                        ),
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              widget.item.summary,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                    )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}