// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) => ArticleModel(
      id: json['id'] as int,
      title: json['title'] as String,
      date: DateTime.parse(json['published'] as String),
      author: json['author'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      language: json['language'] as String,
      url: json['url'] as String,
      category:
          (json['category'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ArticleModelToJson(ArticleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'image': instance.image,
      'author': instance.author,
      'language': instance.language,
      'category': instance.category,
      'published': instance.date.toIso8601String(),
    };
