import 'package:get_it/get_it.dart';
import 'package:movie_app/model/app_config.dart';

class Movie {
  final String name;
  final String language;
  final bool isAdult;
  final String description;
  final String posterPath;
  final String backdropPath;
  final num rating;
  final String releaseDate;
  Movie({
    required this.name,
    required this.language,
    required this.isAdult,
    required this.description,
    required this.posterPath,
    required this.backdropPath,
    required this.rating,
    required this.releaseDate,
  });
  factory Movie.fromJson(Map<String, dynamic> _json) {
    return Movie(
      name: _json["name"],
      language: _json["original_language"],
      isAdult: _json["adult"],
      description: _json["overview"],
      posterPath: _json["poster_path"],
      backdropPath: _json["backdrop_path"],
      rating: _json["vote_average"],
      releaseDate: _json["release_date"],
    );
  }
  String posterUrl() {
    final AppConfig _appConfig = GetIt.instance.get<AppConfig>();
    return "${_appConfig.BASE_IMAGE_API_URL}$posterPath";
  }
}
