import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dio/dio_util.dart';
import '../rest_clients/rest_client.dart';

const _apiBaseUrl = 'https://finnhub.io/api/v1';

final restClientProvider = Provider<RestClient>((ref) {
  final dio = DioUtil.getInstance().createDioInstance();

  return RestClient(
    dio,
    baseUrl: _apiBaseUrl,
  );
});
