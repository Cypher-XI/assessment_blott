import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_model.freezed.dart';
part 'news_model.g.dart';

@freezed
class NewsModel with _$NewsModel {
  const factory NewsModel({
    @JsonKey(name: 'image') required String thumbnail,
    required String source,
    @JsonKey(name: 'datetime') required int date,
    @JsonKey(name: 'headline') required String title,
    required String url,
  }) = _NewsModel;

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
}
