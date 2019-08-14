import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvmaze_search_bloc/tiles/SearchTvShowTile.dart';
import 'package:tvmaze_search_bloc/tiles/TvShowTile.dart';
import '../blocs/SearchBloc.dart';
import '../model/ListFromSearchTvMaze.dart';
import '../model/TvShow.dart';
import '../details/DetailsWidget.dart';

class HomePageBloc extends StatefulWidget {
  HomePageBloc({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageStateBloc createState() => _MyHomePageStateBloc();
}

class _MyHomePageStateBloc extends State<HomePageBloc> {
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
          SearchTvShowTile(_searchBloc),
          // StreamBuilder -> widget que é capaz de modificar o estado dele ouvind um fluxo de dados
          StreamBuilder<ListFromSearchTvMaze>(
              stream: _searchBloc.apiResultFlux,
              builder:
                  (BuildContext context,
                  AsyncSnapshot<ListFromSearchTvMaze> snapshot) {
                return snapshot.hasData
                    ? GridView.builder(
                    scrollDirection: Axis.vertical,
                    physics: PageScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.all(5.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 2.0,
                      crossAxisSpacing: 2.0,
                      childAspectRatio: 0.64,
                    ),
                    itemCount: snapshot.data.tvShows.length,
                    itemBuilder: (context, index){
                      TvShow item = snapshot.data.tvShows[index];
                      return TvShowTile(item);
                    }
                )
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
