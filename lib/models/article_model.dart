import 'package:json_annotation/json_annotation.dart';

part 'article_model.g.dart';

@JsonSerializable()
class ArticleModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "url")
  final String url;
  @JsonKey(name: "image")
  final String image;
  @JsonKey(name: "author")
  final String author;
  @JsonKey(name: "language")
  final String language;
  @JsonKey(name: "category")
  final List<String> category;
  @JsonKey(name: "published")
  final DateTime date;

  const ArticleModel({
    required this.id,
    required this.title,
    required this.date,
    required this.author,
    required this.description,
    required this.image,
    required this.language,
    required this.url,
    required this.category,
  });
  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
}
