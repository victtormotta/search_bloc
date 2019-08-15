import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:tvmaze_search_bloc/blocs/SearchCastBloc.dart';
import 'package:tvmaze_search_bloc/model/Cast.dart';
import 'package:tvmaze_search_bloc/model/ListCastTvMaze.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';

class CastTileBloc extends StatelessWidget {
  final SearchCastBloc _searchCastBloc;

  CastTileBloc(this._searchCastBloc);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ListCastTvMaze>(
        stream: _searchCastBloc.apiResultFlux,
        builder:
            (BuildContext context, AsyncSnapshot<ListCastTvMaze> snapshot) {
          return snapshot.hasData
              ? Container(
                  height: 480,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      Cast item = snapshot.data.casts[index];
                      String tag_name = item.name + "_cast";
                      return _castView(context, item, snapshot.data.casts);
                    },
                    indicatorLayout: PageIndicatorLayout.COLOR,
                    autoplay: true,
                    itemCount: snapshot.data.casts.length,
                    pagination: SwiperPagination(),
                    containerHeight: 0.9,
                    itemWidth: 40,
                    itemHeight: 40,
                    layout: SwiperLayout.DEFAULT,
                  ))
              : Container(
                  height: 500,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ));
        });
  }

  Widget _items(BuildContext context, Cast item, String tag_name) {
    // ROUNDED:
    return Container(
      child: GestureDetector(
        child: Hero(
          tag: tag_name,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18.0),
            child: FadeInImage(
              image: NetworkImage(item.image),
              fit: BoxFit.cover,
              placeholder: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwt_P-IiO7iiAGO3n-5nTfhR7JoLJI8wsqO_kGqm9Y4H0qcAijdw"),
            ),
          ),
        ),
      ),
    );
  }

  Widget _castView(BuildContext context, Cast item, List<Cast> castList) {
    return Wrap(
      runSpacing: 6.0,
      children: castList.map((i) {
        return SizedBox(
          width: MediaQuery.of(context).size.width / 4,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new SizedBox(
                child: Container(
                  child: Image.network(item.image),
                ),
                height: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width,
              ),
//                      new Padding(padding: new EdgeInsets.only(top:6.0),child: new Text("$i"),)
            ],
          ),
        );
      }).toList(),
    );
  }
}
