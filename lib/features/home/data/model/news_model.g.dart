// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsModelImpl _$$NewsModelImplFromJson(Map<String, dynamic> json) =>
    _$NewsModelImpl(
      thumbnail: json['image'] as String,
      source: json['source'] as String,
      date: (json['datetime'] as num).toInt(),
      title: json['headline'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$NewsModelImplToJson(_$NewsModelImpl instance) =>
    <String, dynamic>{
      'image': instance.thumbnail,
      'source': instance.source,
      'datetime': instance.date,
      'headline': instance.title,
      'url': instance.url,
    };
