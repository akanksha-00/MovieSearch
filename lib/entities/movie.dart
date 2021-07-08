class MovieEntity {
  final int id;
  final String overview;
  final String releaseDate;
  final String title;
  //final String imageUrl;
  final num popularity;
  final num rating;

  MovieEntity({
    required this.id,
    required this.overview,
    required this.releaseDate,
    required this.title,
    //required this.imageUrl,
    required this.popularity,
    required this.rating,
  });
}
