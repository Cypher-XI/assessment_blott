import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/net/providers/client_provider.dart';
import '../../../../core/net/rest_clients/rest_client.dart';
import '../model/news_model.dart';

abstract class IHomeRepository {
  ///
  Future<List<NewsModel>> fetchNews();
}

///
class HomeRepositoryImpl implements IHomeRepository {
  late final RestClient _appRestClient;

  HomeRepositoryImpl(this._appRestClient);

  void dispose() {}

  @override
  Future<List<NewsModel>> fetchNews() {
    var resp = _appRestClient.fetchNews(category: 'General');
    return resp;
  }
}

final homeRepositoryProvider = Provider<HomeRepositoryImpl>((ref) {
  final appRestClient = ref.watch(restClientProvider);
  final authRepo = HomeRepositoryImpl(appRestClient);
  ref.onDispose(() => authRepo.dispose());
  return authRepo;
});
