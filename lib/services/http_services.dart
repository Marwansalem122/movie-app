import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/model/app_config.dart';

class HttpServices {
  final Dio _dio = Dio();
  final GetIt getIt = GetIt.instance;
  String? _baseUrl;
  String? _apiKey;
  HttpServices() {
    AppConfig _appConfig = getIt.get<AppConfig>();
    _apiKey = _appConfig.API_KEY;
    _baseUrl = _appConfig.BASE_API_URL;
  }
  Future<Response> get(String path, {Map<String, dynamic>? query}) async {
    try {
      String _url = "$_baseUrl$path";
      Map<String, dynamic> _query = {"api_key": _apiKey, "language": "en-US"};
      if (query != null) {
        _query.addAll(query);
      }
      return await _dio.get(_url, queryParameters: _query);
    } on DioException catch (e) {
      print("Dio Exception in get :$e");
      rethrow ;
    }
  }
}
