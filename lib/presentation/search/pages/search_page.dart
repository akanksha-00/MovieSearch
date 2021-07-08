import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_internship/entities/movie.dart';
import 'package:movie_app_internship/presentation/movie_list/pages/movie_list.dart';
import 'package:movie_app_internship/presentation/search/bloc/movie_search_bloc.dart';
import 'package:movie_app_internship/presentation/search/bloc/movie_search_event.dart';
import 'package:movie_app_internship/presentation/search/bloc/movie_search_state.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  final TextEditingController year = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Movie Search',
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        elevation: 0.0,
      ),
      body: BlocConsumer<SearchBloc, SearchState>(
        listener: (context, state) {
          if (state is FailureState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
              'Something went wrong',
              softWrap: true,
            )));
          } else if (state is SuccessState) {
            List<MovieEntity> movieList = context.read<SearchBloc>().movieList;
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MoviesListPage(
                    year: year.text, movieList: movieList)));
          }
        },
        builder: (context, state) {
          return Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/poster.jpg'), fit: BoxFit.cover),
            ),
            height: MediaQuery.of(context).size.height,
            //color: Colors.amber,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 80.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Year',
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 0.0, horizontal: 20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 19.0,),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 3.0,
                                      color: Colors.black,
                                      style: BorderStyle.solid)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      width: 3.0,
                                      color: Colors.black,
                                      style: BorderStyle.solid)),
                            ),
                            controller: year,
                            onChanged: (val) {
                              context
                                  .read<SearchBloc>()
                                  .add(TypeEvent(textYear: val));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  state is InitialState ||
                          context.read<SearchBloc>().isvalidYear
                      ? Container()
                      : Text(
                          'Enter valid year',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                  SizedBox(
                    height: 20.0,
                  ),
                  MaterialButton(
                    onPressed: () {
                      print(year.text);
                      context
                          .read<SearchBloc>()
                          .add(SubmitEvent(year: year.text));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 20.0),
                      child: Text(
                        'Get Movie',
                        style: TextStyle(color: Colors.white, fontSize: 19.0),
                      ),
                    ),
                    color: Colors.grey[900],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
