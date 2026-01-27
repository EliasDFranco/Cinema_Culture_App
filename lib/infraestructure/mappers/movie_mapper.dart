import 'package:cinema_culture/domain/entities/movie.dart';
import 'package:cinema_culture/infraestructure/models/moviesdb/movies_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(
      adult: moviedb.adult,
      backdropPath: (moviedb.backdropPath != '')
          ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
          : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCj1JjEMlgdIcu7uGBuqpkQHjiS-l75fWCp7agvTu-hg&s&ec=121507568',
      description: moviedb.description,
      genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
      id: moviedb.id,
      originalLanguaje: moviedb.originalLanguage,
      originalTitle: moviedb.originalTitle,
      popolarityScore: moviedb.popularity,
      posterPath: (moviedb.posterPath != '')
          ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
          : 'no-poster',
      rating: moviedb.rating.toDouble(),
      ratingsCount: moviedb.ratingsCount.toDouble(),
      releaseDate: moviedb.releaseDate,
      title: moviedb.title,
      trailerVideo: moviedb.trailerVideo);
}
