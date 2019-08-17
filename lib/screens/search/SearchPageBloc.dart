import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvmaze_search_bloc/tiles/search/GridCard.dart';
import 'package:tvmaze_search_bloc/tiles/search/SearchTextField.dart';
import '../../blocs/SearchBloc.dart';
import '../../model/ListFromSearchTvMaze.dart';

/*
  Class responsible for the search; Bloc implemented;
 */

class SearchPageBloc extends StatefulWidget {
  SearchPageBloc({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MySearchPageBlocStateBloc createState() => _MySearchPageBlocStateBloc();
}

class _MySearchPageBlocStateBloc extends State<SearchPageBloc> {
  // BEGIN BLOC
  SearchBloc _searchBloc;

  // TODO o metodo BLOC no init state ira ser executado uma unica vez antes do componente ser montado;
  @override
  void initState() {
    _searchBloc = new SearchBloc();
    super.initState();
  }

  @override
  void dispose() {
    _searchBloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          // SearchTvShowTile -> sending searchbloc to textSearch
          TvShowSearchTile(_searchBloc),
          // StreamBuilder -> widget que é capaz de modificar o estado dele ouvind um fluxo de dados
          StreamBuilder<ListFromSearchTvMaze>(
              stream: _searchBloc.apiResultFlux,
              builder:
                  (BuildContext context,
                  AsyncSnapshot<ListFromSearchTvMaze> snapshot) {
                return snapshot.hasData
                    ? GridCard(snapshot.data)
                    : Container(height: 500, child: Center(
                  child: CircularProgressIndicator(),
                ));
              })
        ],
      ),
    );
  }
  // END BLOC
}
