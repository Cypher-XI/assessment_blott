// import 'package:dio/dio.dart' hide Headers;
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../features/home/data/model/news_model.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {required String baseUrl}) = _RestClient;

  @GET('/news')
  Future<List<NewsModel>> fetchNews({
    @Query('category') required String category,
  });
}
