import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:weatherapp/repository/sharedprefs.dart';

class HttpNetworkUtil {
  // Setup a singleton
  static final HttpNetworkUtil _httpClient = HttpNetworkUtil._internal();
  factory HttpNetworkUtil() {
    return _httpClient;
  }
  HttpNetworkUtil._internal();

  // global variables
  final Logger _logger = Logger();

  static BaseOptions baseOptions = BaseOptions(
    baseUrl: "https://sandbox.damu-sasa.com/api/v1",
    contentType: 'application/json',
    connectTimeout: 30 * 1000,
    receiveTimeout: 30 * 1000,
    followRedirects: true,
    receiveDataWhenStatusError: true,
  );

  static Dio dio = Dio(baseOptions);

  // methods
  Future<Response> getRequest(String endpoint) async {
    try {
      Dio _dio = await addInterceptors();
      Response response = await _dio.get(
        endpoint,
      );
      _logger.i(
          "getRequest:\nurl:${response.realUri.toString()}\nresponse:${response.data}");
      return response;
    } catch (e) {
      _logger.e(e);
      rethrow;
    }
  }

  Future<Dio> addInterceptors() async {
    String token = await PreferencesRepository().getToken();
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) {
          if (token != '') {
            request.headers['Authorization'] = "Bearer $token";
          }
          return handler.next(request);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (err, handler) async {
          if (err.response?.statusCode == 401) {
            try {
              _logger.e('401 error');
              // dio.interceptors.requestLock.lock();
              
            } catch (e) {
              return handler.reject(err);
            }
          } else {
            return handler.next(err);
          }
        },
      ),
    );
    return dio;
  }

  
}
