import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static String theMovieDbKey =
      dotenv.env['THE_MOVIE_KEY'] ?? 'There is no API KEY';
}
