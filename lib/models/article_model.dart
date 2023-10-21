import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article_model.g.dart';

@JsonSerializable()
class ArticleModel extends Equatable {
  @JsonKey(name: "id")
  final String id;
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

  ArticleModel copyWith(
      {String? id,
      String? title,
      DateTime? date,
      String? author,
      String? description,
      String? image,
      String? language,
      String? url,
      List<String>? category}) {
    return ArticleModel(
      id: id ?? this.id,
      title: title ?? this.title,
      date: date ?? this.date,
      author: author ?? this.author,
      description: description ?? this.description,
      image: image ?? this.image,
      language: language ?? this.language,
      url: url ?? this.url,
      category: category ?? this.category,
    );
  }

  @override
  List<Object?> get props =>
      [id, title, date, author, description, image, language, url, category];
}
