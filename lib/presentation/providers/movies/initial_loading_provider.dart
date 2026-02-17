import 'package:cinema_culture/presentation/providers/movies/movies_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final stepOne = ref.watch(nowPlayingMoviesProvider).isEmpty;
  final stepTwo = ref.watch(popularMoviesProvider).isEmpty;
  final stepThree = ref.watch(upComingMoviesProvider).isEmpty;
  final stepFour = ref.watch(topRatedMoviesProvider).isEmpty;

  if (stepOne || stepTwo || stepThree || stepFour) return true;

  return false;
});
