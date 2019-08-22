import 'package:flutter/material.dart';
import 'package:tvmaze_search_bloc/constants/Constants.dart' as Constants;

class LogoTvMaze extends StatelessWidget {

  LogoTvMaze();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: Image.network(Constants.LOGO_TV_MAZE, fit: BoxFit.fitHeight,
      ),
    );
  }
}
