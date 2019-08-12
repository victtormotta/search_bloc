import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  // END BLOC

  // COM BLOC
  Widget _textField() {
    return Container(
      color: Colors.black26,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          style: TextStyle(color: Colors.white),
          // cada vez que for digitado algo no textfield, o metodo onchaged ira ser chamado e add o q
          // o usuario digitou no fluxo
          onChanged: _searchBloc.searchEvent.add,
          decoration: InputDecoration(
            prefixIcon: Icon(CupertinoIcons.search, color: Colors.white,),
            border: OutlineInputBorder(),
            hintText: "Tv Show name...",
            hintStyle: TextStyle(color: Colors.white30),
//            labelText: "Search"
          ),
        ),
      )
    );

  }

  Widget _items(TvShow item, String tag_name) {
    return Container(
      height: 200,
      child: GestureDetector(
        child: Hero(
          tag: tag_name,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18.0),
            child: FadeInImage(
              image: NetworkImage(item.image),
              fit: BoxFit.cover,
              placeholder: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTB7suUSfqcNx7SVHZoskbX1LoDsx_XC7A789qGRl4F-1eDYq5f"),
            ),
          ),
        ),
        onTap: () => Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => DetailsWidget(item: item
                ))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text("TV Shows Search"),
//      ),
      body: ListView(
        children: <Widget>[
          _textField(),
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
                // OLD
//                ListView.builder(
//                  shrinkWrap: true,
//                  physics: ClampingScrollPhysics(),
//                  itemCount: snapshot.data.tvShows.length,
//                  itemBuilder: (BuildContext context, int index) {
//                    TvShow item = snapshot.data.tvShows[index];
//                    String tag_name = item.url + "_search";
//                    return _items(item, tag_name);
//                  },
//                )
                    : Container(height: 500, child: Center(
                  child: CircularProgressIndicator(),
                ));
              })
        ],
      ),
    );
  }
}
