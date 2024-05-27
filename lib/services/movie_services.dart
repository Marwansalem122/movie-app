import 'package:get_it/get_it.dart';
import 'package:movie_app/services/http_services.dart';

class MovieServices {
  final GetIt getIt = GetIt.instance;
  HttpServices? _http;
  MovieServices() {
    _http = getIt.get<HttpServices>();
  }
}
