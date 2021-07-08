import 'package:flutter/material.dart';
import 'package:movie_app_internship/entities/movie.dart';

class MovieDetails extends StatelessWidget {
  final MovieEntity movieEntity;

  const MovieDetails({Key? key, required this.movieEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movieEntity.title),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 16.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.asset(
                      'images/movie.jpg',
                      height: 120.0,
                      width: 120.0,
                    ),
                    SizedBox(
                      width: 18.0,
                    ),
                    Container(
                      color: Colors.grey[400],
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20.0,
                          horizontal: 10.0,
                        ),
                        child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              text('Release Date: ${movieEntity.releaseDate}',
                                  18.0),
                              text('Rating: ${movieEntity.rating}', 18.0),
                              text('Popularity: ${movieEntity.popularity}',
                                  18.0),
                            ]),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                text('About: ', 25.0),
                SizedBox(
                  height: 15.0,
                ),
                text(movieEntity.overview, 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text text(String detail, double size) {
    return Text(detail,
        style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.bold,
        ));
  }
}
