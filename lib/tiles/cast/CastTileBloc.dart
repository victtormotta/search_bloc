import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvmaze_search_bloc/blocs/SearchCastBloc.dart';
import 'package:tvmaze_search_bloc/model/ListCastTvMaze.dart';

import 'CastCardTile.dart';

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
              ? CastCardTile(snapshot.data.casts)
              : Container(
                  height: 500,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ));
        });
  }
}
