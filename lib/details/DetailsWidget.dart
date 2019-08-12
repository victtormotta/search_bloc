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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: Text(widget.item.name + " - " + widget.item.platform ?? "name tvshow")),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
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
    );
  }
}