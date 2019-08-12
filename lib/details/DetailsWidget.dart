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
                      fit: BoxFit.cover,
                      height: size.height,
                      width: size.width,
      /*                    //half-size page
                          fit: BoxFit.cover,
                          height: size.height/2,
                          width: size.width,*/
                      placeholder: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTB7suUSfqcNx7SVHZoskbX1LoDsx_XC7A789qGRl4F-1eDYq5f"),
                    ),
                  ),
                ),
                Container(height: size.height, child: Center(
                  child: Card(
                      color: Colors.white12,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          AspectRatio(
                              aspectRatio: 0.63,
                              child: Text("Example", style: TextStyle(color: Colors.white, fontSize: 40),)
                          ),
                        ],
                      )
                  ),
                ),
                ),
              ],
            )

//              Scaffold(
//                  body: Container(
//                    decoration: BoxDecoration(
//                      image: DecorationImage(image: NetworkImage(widget.item.image), fit: BoxFit.cover),
//                    ),
//                    child: Center(child: Text('Welcome To',style: TextStyle(
//                        color: Colors.white,
//                        fontSize: 40.0
//                    ),)),
//                  )
//              )
//              Container(
//                child: Card(
//                    color: Colors.transparent,
//                    shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.circular(4.0),
//                    ),
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.stretch,
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      children: <Widget>[
//                        AspectRatio(
//                          aspectRatio: 0.63,
//                          child:
////                          Hero(
////                            tag: widget.item.url,
////                            transitionOnUserGestures: true,
////                            child: ClipRRect(
////                              borderRadius: BorderRadius.circular(4.0),
////                              child: FadeInImage(
////                                image: NetworkImage(widget.item.image),
////                                fit: BoxFit.fill,
////                                placeholder: NetworkImage(
////                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwt_P-IiO7iiAGO3n-5nTfhR7JoLJI8wsqO_kGqm9Y4H0qcAijdw"),
////                              ),
////                            ),
////                          ),
//                        ),
//                      ],
//                    )
//                ),
//              ),
            ],
          ),
        ),
      ),
    );
/*    Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: Text(widget.item.name + " - " + widget.item.platform ?? "name tvshow")),
      body:
      SingleChildScrollView(
        child: Container(
          width: size.width,
//          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 10,
              ),
              Hero(
                tag: widget.item.url ?? "url",
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40.0),
                  child: FadeInImage(
                    image: NetworkImage(widget.item.image),
                    fit: BoxFit.cover,
                    height: size.height - 30,
                    width: size.width - 20,
                    placeholder: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTB7suUSfqcNx7SVHZoskbX1LoDsx_XC7A789qGRl4F-1eDYq5f"),
                  ),
                ),
              ),
              Container(
                height: 10,
              ),
//              Text(
//                widget.item.name ?? "name",
//                style: TextStyle(
//                  fontWeight: FontWeight.bold,
//                  fontSize: 18,
//                  color: Colors.grey[700],
//                ),
//              ),

//              Container(
//                height: 10,
//              ),
//
//              Text(
//                widget.item.url ?? "url",
//                style: TextStyle(
//                  fontSize: 14,
//                  color: Colors.grey[500],
//                ),
//              ),
            ],
          ),
        ),
      ),
    );*/
  }
}