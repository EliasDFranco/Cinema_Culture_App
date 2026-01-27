import 'package:cinema_culture/config/constants/enviroment.dart';
import 'package:cinema_culture/domain/datasources/movie_datasource.dart';
import 'package:cinema_culture/domain/entities/movie.dart';
import 'package:cinema_culture/infraestructure/mappers/movie_mapper.dart';
import 'package:cinema_culture/infraestructure/models/moviesdb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MoviesdbDatasource extends MoviesDatasource {
  final dio =
      Dio(BaseOptions(baseUrl: 'https://api.themoviedb.org/3', queryParameters: {
    'api_key': Enviroment.theMovieDbKey,
    'language': 'es-Mx',
  }));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');
    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDBResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();
    return movies;
  }
}
