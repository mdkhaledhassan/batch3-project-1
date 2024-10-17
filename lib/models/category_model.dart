// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
    final String? message;
    final List<Category>? data;

    CategoryModel({
        this.message,
        this.data,
    });

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        message: json["message"],
        data: json["data"] == null ? [] : List<Category>.from(json["data"]!.map((x) => Category.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Category {
    final int? id;
    final String? catname;
    final String? picture;

    Category({
        this.id,
        this.catname,
        this.picture,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        catname: json["catname"],
        picture: json["picture"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "catname": catname,
        "picture": picture,
    };
}
