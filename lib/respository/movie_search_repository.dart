import 'dart:convert';

import 'package:movie_app_internship/entities/movie.dart';
import 'package:http/http.dart' as http;

class SearchRepository {
  String _key = 'e9b775c9c4e7aa37b6ebe2760ea174d5';
  String _baseURL = 'https://api.themoviedb.org/3/discover/movie?';
  String _baseImageURL = 'http://image.tmdb.org/t/p';
  String _sortBy = 'popularity.desc';

  Future<Map<String, dynamic>> getData(String year) async {
    try {
      String searchURL = _baseURL +
          'api_key=' +
          _key +
          '&primary_release_year=' +
          year +
          '&sort_by' +
          _sortBy;
      print(searchURL);
      http.Response result = await http.get(Uri.parse(searchURL));
      Map<String, dynamic> map = jsonDecode(result.body);
      return map;
    } on Exception catch (e) {
      print(e.toString());
      return <String, dynamic>{};
    }
  }

  List<MovieEntity> getList(Map<String, dynamic> raw) {
    if (raw.containsKey('results')) {
      List rawList = raw['results'];
      print('---------------');
      print(rawList);

      List<MovieEntity> movieList = <MovieEntity>[];

      rawList.forEach((result) {
        String title = result["title"] ?? "";
        int id = result["id"] ?? "";
        String overview = result["overview"] ?? "";
        String releaseDate = result["release_date"] ?? "";
        //String imageUrl = _baseImageURL + (result["poster_path"] ?? "");
        num popularity = result["popularity"] ?? 0.0;
        num rating = result["vote_average"] ?? 2.3;

        movieList.add(MovieEntity(
          id: id,
          overview: overview,
          releaseDate: releaseDate,
          title: title,
          //imageUrl: imageUrl,
          popularity: popularity,
          rating: rating,
        ));
      });

      print('---------------');
      print(movieList);

      if (movieList.length > 20) {
        movieList = movieList.sublist(0, 20);
      }

      return movieList;
    }

    return [];
  }
}
