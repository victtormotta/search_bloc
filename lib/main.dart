import 'package:tvshow_search_bloc/model/TvShow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tvshow_search_bloc/model/ListFromSearchTvMaze.dart';

import 'blocs/SearchBloc.dart';
import 'details/DetailsWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tv Show',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(title: 'By Tv Maze'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        // cada vez que for digitado algo no textfield, o metodo onchaged ira ser chamado e add o q
        // o usuario digitou no fluxo
        onChanged: _searchBloc.searchEvent.add,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Tv Show name...",
            labelText: "Search"),
      ),
    );
  }

  Widget _items(TvShow item) {
    return ListTile(
      leading: Hero(
        tag: item.url ?? "url",
        child: CircleAvatar(
          backgroundImage: NetworkImage(item?.image ??
              "https://d2v9y0dukr6mq2.cloudfront.net/video/thumbnail/VCHXZQKsxil3lhgr4/animation-loading-circle-icon-on-white-background-with-alpha-channel-4k-video_sjujffkcde_thumbnail-full01.png"),
        ),
      ),
      title: Text(item?.name ?? "nome"),
      subtitle: Text(item?.status ?? "status"),
      onTap: () => Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (context) => DetailsWidget(
                    item: item,
                  ))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TV Shows Search"),
      ),
      body: ListView(
        children: <Widget>[
          _textField(),
          // StreamBuilder -> widget que é capaz de modificar o estado dele ouvind um fluxo de dados
          StreamBuilder<ListFromSearchTvMaze>(
              stream: _searchBloc.apiResultFlux,
              builder:
                  (BuildContext context, AsyncSnapshot<ListFromSearchTvMaze> snapshot) {
                return snapshot.hasData
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: snapshot.data.tvShows.length,
                        itemBuilder: (BuildContext context, int index) {
                          TvShow item = snapshot.data.tvShows[index];
                          return _items(item);
                        },
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              })
        ],
      ),
    );
  }
}
