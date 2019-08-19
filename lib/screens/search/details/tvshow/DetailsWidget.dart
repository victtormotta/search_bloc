import 'package:flutter/cupertino.dart';
=import 'package:tvmaze_search/transition/FadeRoute.dart';
import 'package:tvmaze_search/model/ListCastTvMaze.dart';
import 'package:tvmaze_search/model/Cast.dart';
import '../../../../model/TvShow.dart';
import 'package:flutter/material.dart';

/*
  Class responsible for display tvshow's details; such as synopis, cast, etc;
 */
class DetailsWidget extends StatelessWidget {
  final TvShow item;

  DetailsWidget(this.item);


  @override
  Widget build(BuildContext context) {
    /*method to get actual size of device*/
    Size size = MediaQuery.of(context).size;
    /*add id of tvshow to be listen on Bloc's Sink*/
    final SearchCastBloc searchCastBloc = SearchCastBloc();
    searchCastBloc.searchEvent.add(item.id);

    return CupertinoPageScaffold(
      backgroundColor: Colors.white12,
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: "Back",
        backgroundColor: Colors.grey[800],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Container(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              /*Poster and PosterFullSize*/
              Column(
                children: <Widget>[
                  Container(height: 10),
                  GestureDetector(
                      child: Hero(
                        tag: item.url ?? "url",
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: FadeInImage(
                            fadeInDuration: Duration(milliseconds: 200),
                            image: NetworkImage(item.image),
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
                          FadeRoute(page: Scaffold(
                            body: GestureDetector(
                              child: Center(
                                child: Hero(
                                  tag: 'imageHero',
                                  child: Image.network(item.image),
                                ),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ))))
                ],
              ),
              /*TitleTv*/
              Container(
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
                              item.name,
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
                            item.premiered,
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
                            item.platform,
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
              ),
              /*Synopsis*/
              Container(
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
                          item.summary,
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
              ),
              /*TitleCast*/
              Container(
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
              ),
              /*DetailsCast*/
              StreamBuilder<ListCastTvMaze>(
                  stream: searchCastBloc.apiResultFlux,
                  builder:
                      (BuildContext context, AsyncSnapshot<ListCastTvMaze> snapshot) {
                    return snapshot.hasData
                        ? SingleChildScrollView(
                        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                          SizedBox(
                            height: 180.0,
                            child: ListView.builder(
                                padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data.casts.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final Cast item = snapshot.data.casts[index];
                                  return Card(
                                    color: Colors.white12,
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
                        ])
                        )
                        : Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}