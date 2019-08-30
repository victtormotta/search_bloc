import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tvmaze_search_bloc/blocs/SearchCastBloc.dart';
import 'package:tvmaze_search_bloc/model/cast/list/ListCast.dart';
import 'package:tvmaze_search_bloc/component/tiles/search/details/tvshow/cast/ListCard.dart';

class DetailsCastList extends StatelessWidget {
  final String id;

  DetailsCastList(this.id);

  @override
  Widget build(BuildContext context) {
    print('DetailsCastBloc redraw');

    final SearchCastBloc searchCastBloc = SearchCastBloc();
    searchCastBloc.searchEvent.add(id);

    return StreamBuilder<ListCast>(
        stream: searchCastBloc.apiResultFlux,
        builder:
            (BuildContext context, AsyncSnapshot<ListCast> snapshot) {
          return snapshot.hasData
              ? ListCard(snapshot.data.casts)
              : Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ));
        });
  }
}
