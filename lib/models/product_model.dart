import 'package:mastore_app/models/category_model.dart';
import 'package:mastore_app/models/gallery_model.dart';

class ProductModel {
  int? id;
  String? name;
  double? price;
  String? description;
  String? tags;
  CategoryModel? category;
  DateTime? created_at;
  DateTime? updated_at;
  List<GalleryModel>? galleries;

  ProductModel({
    this.id,
    this.name,
    this.price,
    this.description,
    this.tags,
    this.category,
    this.created_at,
    this.updated_at,
    this.galleries,
  });

  ProductModel.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = double.parse(json['price'].toString());
    description = json['description'];
    tags = json['tags'];
    category = CategoryModel.fromJson(json['category']);
    created_at = DateTime.parse(json['created_at']);
    updated_at = DateTime.parse(json['updated_at']);
    galleries = json['galleries']
        .map<GalleryModel>((gallery) => GalleryModel.fromJson(gallery))
        .toList();
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'tags': tags,
      'category': category?.toJson(),
      'galleries': galleries?.map((gallery) => gallery.toJson()).toList(),
      'created_at': created_at.toString(),
      'updated_at': updated_at.toString()
    };
  }
}
