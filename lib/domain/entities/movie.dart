// Gist of Movie
class Movie {
  final bool adult;
  final String backdropPath;
  final List<String> genreIds;
  final int id;
  final String originalLanguaje;
  final String originalTitle;
  final String description;
  final double popolarityScore;
  final String posterPath;
  final DateTime releaseDate;
  final String title;
  final bool trailerVideo;
  final double rating;
  final double ratingsCount;

  Movie(
      {required this.adult,
      required this.backdropPath,
      required this.description,
      required this.genreIds,
      required this.id,
      required this.originalLanguaje,
      required this.originalTitle,
      required this.popolarityScore,
      required this.posterPath,
      required this.rating,
      required this.ratingsCount,
      required this.releaseDate,
      required this.title,
      required this.trailerVideo});
}
