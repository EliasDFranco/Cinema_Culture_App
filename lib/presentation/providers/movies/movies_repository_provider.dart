// Read only provider
// This repository is immutable
import 'package:cinema_culture/infraestructure/datasources/moviedb_datasource.dart';
import 'package:cinema_culture/infraestructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviesdbDatasource());
});
