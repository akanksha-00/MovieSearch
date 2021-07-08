import 'package:flutter/material.dart';
import 'package:movie_app_internship/entities/movie.dart';
import 'package:movie_app_internship/presentation/movie_detail.dart/pages/movie_detail_page.dart';

class MoviesListPage extends StatelessWidget {
  final String year;
  final List<MovieEntity> movieList;

  const MoviesListPage({Key? key, required this.year, required this.movieList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('year is :' + year);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Movies - $year',
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        elevation: 0.0,
      ),
      body: movieList.isEmpty
          ? Container(
              color: Colors.grey[400],
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/no_result.png',
                    height: 100.0,
                    width: 100.0,
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Sorry, no results found!!',
                    style: TextStyle(
                      fontSize: 19.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          : Container(
              color: Colors.grey[400],
              child: ListView.builder(
                itemCount: movieList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListTile(
                          tileColor: Colors.white,
                          leading: Icon(
                            Icons.movie,
                            color: Colors.black,
                            size: 50.0,
                          ),
                          title: Text(
                            movieList[index].title,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                movieList[index].rating.toString(),
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 4.0),
                              Icon(Icons.star,size: 20.0,),
                            ],
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MovieDetails(
                                    movieEntity: movieList[index])));
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
