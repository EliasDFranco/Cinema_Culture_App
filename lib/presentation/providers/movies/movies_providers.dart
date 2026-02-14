import 'package:cinema_culture/domain/entities/movie.dart';
import 'package:cinema_culture/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Provider of nowPlaying | GET
final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;
  final notifier = MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies,
  );
  // Perform the initial load outside of the constructor to avoid async issues
  notifier.loadNextPage();
  return notifier;
});

// Provider of popular | GET
final popularMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getPopular;
  final notifier = MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies,
  );

  notifier.loadNextPage();
  return notifier;
});

typedef MovieCallBack = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  MovieCallBack fetchMoreMovies;

  MoviesNotifier({required this.fetchMoreMovies}) : super([]);

  Future<void> loadNextPage() async {
    currentPage++;
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
  }
}
