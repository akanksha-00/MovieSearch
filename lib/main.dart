import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_internship/presentation/search/bloc/movie_search_bloc.dart';
import 'package:movie_app_internship/respository/movie_search_repository.dart';

import 'presentation/search/pages/search_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BlocProvider(
        create: (context) => SearchBloc(searchRepository: SearchRepository()),
        child: SearchPage(),
      ),
    );
  }
}
