import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvmaze_search_bloc/blocs/SearchCastBloc.dart';
import 'package:tvmaze_search_bloc/model/ListCastTvMaze.dart';
import 'package:tvmaze_search_bloc/tiles/search/details/tvshow/cast/ListCard.dart';

class DetailsCastBloc extends StatelessWidget {
  final SearchCastBloc _searchCastBloc;

  DetailsCastBloc(this._searchCastBloc);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ListCastTvMaze>(
        stream: _searchCastBloc.apiResultFlux,
        builder:
            (BuildContext context, AsyncSnapshot<ListCastTvMaze> snapshot) {
          return snapshot.hasData
              ? ListCard(snapshot.data.casts)
              : Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ));
        });
  }
}
