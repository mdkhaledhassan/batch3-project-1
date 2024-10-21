// To parse this JSON data, do
//
//     final categoryProductModel = categoryProductModelFromJson(jsonString);

import 'dart:convert';

CategoryProductModel categoryProductModelFromJson(String str) => CategoryProductModel.fromJson(json.decode(str));

String categoryProductModelToJson(CategoryProductModel data) => json.encode(data.toJson());

class CategoryProductModel {
    final String? message;
    final List<CategoryProduct>? data;

    CategoryProductModel({
        this.message,
        this.data,
    });

    factory CategoryProductModel.fromJson(Map<String, dynamic> json) => CategoryProductModel(
        message: json["message"],
        data: json["data"] == null ? [] : List<CategoryProduct>.from(json["data"]!.map((x) => CategoryProduct.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class CategoryProduct {
    final int? id;
    final String? picture;
    final String? title;
    final String? catname;
    final String? price;
    final String? amount;
    final String? quality;
    final String? size;
    final String? description;
    final String? viewCount;
    final String? stock;
    final String? postby;

    CategoryProduct({
        this.id,
        this.picture,
        this.title,
        this.catname,
        this.price,
        this.amount,
        this.quality,
        this.size,
        this.description,
        this.viewCount,
        this.stock,
        this.postby,
    });

    factory CategoryProduct.fromJson(Map<String, dynamic> json) => CategoryProduct(
        id: json["id"],
        picture: json["picture"],
        title: json["title"],
        catname: json["catname"],
        price: json["price"],
        amount: json["amount"],
        quality: json["quality"],
        size: json["size"],
        description: json["description"],
        viewCount: json["view_count"],
        stock: json["stock"],
        postby: json["postby"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "picture": picture,
        "title": title,
        "catname": catname,
        "price": price,
        "amount": amount,
        "quality": quality,
        "size": size,
        "description": description,
        "view_count": viewCount,
        "stock": stock,
        "postby": postby,
    };
}
