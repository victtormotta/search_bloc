import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvmaze_search_bloc/blocs/SearchBloc.dart';

class SearchTvShowTile extends StatelessWidget {

  final SearchBloc _searchBloc;

  SearchTvShowTile(this._searchBloc);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black26,
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
            // cada vez que for digitado algo no textfield, o metodo onchaged ira ser chamado e add o q
            // o usuario digitou no fluxo
            onChanged: _searchBloc.searchEvent.add,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: Colors.black54,),
              border: OutlineInputBorder(),
              hintText: "Tv Show name...",
              hintStyle: TextStyle(color: Colors.black54),
            ),
          ),
        )
    );
  }
}