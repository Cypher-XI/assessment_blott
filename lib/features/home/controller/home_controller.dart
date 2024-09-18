import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/model/news_model.dart';
import '../data/repository/home_repository.dart';

/* class FetchNewsController extends StateNotifier<AsyncValue<dynamic>> {
  FetchNewsController(this.ref) : super(const AsyncData(null));

  final Ref ref;

  Future<void> fetchNews({
    required int pageSize,
    required int page,
    String? order,
    String? status,
  }) async {
    state = const AsyncLoading();
    try {
      final result = await ref.read(homeRepositoryProvider).fetchNews();
      state = AsyncValue.data(result);
    } on DioException catch (e, s) {
      state = AsyncValue.error(e.response?.data, s);
      throw Exception(e);
    }
  }
}

final fetchNewsControllerProvider =
    StateNotifierProvider.autoDispose<FetchNewsController, AsyncValue<void>>(
        (ref) {
  return FetchNewsController(ref);
}); */

class FetchNewsController {
  FetchNewsController(this.ref) : super();

  final Ref ref;

  Future<List<NewsModel>> fetchNews() async {
    try {
      final result = await ref.read(homeRepositoryProvider).fetchNews();
      return result;
    } on DioException catch (e) {
      throw e.toString();
    }
  }
}

final fetchNewsFutureProvider =
    FutureProvider.autoDispose<List<NewsModel>>((ref) async {
  return FetchNewsController(ref).fetchNews();
});
