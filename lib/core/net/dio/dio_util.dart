import 'package:dio/dio.dart';

class DioUtil {
  DioUtil._();

  static DioUtil? _instance;

  static DioUtil getInstance() {
    return _instance ??= DioUtil._();
  }

  Dio _dio = Dio();

  Dio createDioInstance() {
    _dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        responseType: ResponseType.json,
        connectTimeout: const Duration(milliseconds: 15000),
        receiveTimeout: const Duration(milliseconds: 15000),
      ),
    );

    _dio.interceptors.clear();

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers['X-Finnhub-Token'] =
              'crals9pr01qhk4bqotb0crals9pr01qhk4bqotbg';

          return handler.next(options);
        },
        onError: (error, handler) {
          ///
          // print(error);
          return handler.next(error);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
      ),
    );

    return _dio;
  }
}
