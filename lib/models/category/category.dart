import 'package:json_annotation/json_annotation.dart';
part 'category.g.dart';

@JsonSerializable()
class CategoryModel {
  final int id;
  final String name;
  final String image;
  final String creationAt;
  final String updatedAt;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.creationAt,
    required this.updatedAt,
  });

    factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return _$CategoryModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CategoryModelToJson(this);
  }
}