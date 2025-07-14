import 'package:mobx/mobx.dart';
import 'package:mobx/mobx.dart';
part 'product_data.g.dart';

class ProductData extends _ProductDataBase with _$ProductData {
  ProductData({
    required int? id,
    required int? marketId,
    required String? marketName,
    required String? marketNameRu,
    required int? categoryId,
    required String? categoryName,
    required String? categoryNameRu,
    required String? thumbnailUrl,
    required String? name,
    required String? nameRu,
    required double? price,
    required int? discount,
    required String? description,
    required String? descriptionRu,
    required bool? isNew,
    required double? finalPrice,
    required DateTime? createdAt,
    required bool? isFavorite,
    required List<dynamic> thumbnails,
  }) : super(
         id: id,
         marketId: marketId,
         marketName: marketName,
         marketNameRu: marketNameRu,
         categoryId: categoryId,
         categoryName: categoryName,
         categoryNameRu: categoryNameRu,
         thumbnailUrl: thumbnailUrl,
         name: name,
         nameRu: nameRu,
         price: price,
         discount: discount,
         description: description,
         descriptionRu: descriptionRu,
         isNew: isNew,
         finalPrice: finalPrice,
         createdAt: createdAt,
         isFavorite: isFavorite,
         thumbnails: thumbnails,
       );

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      id: json["id"],
      marketId: json["market_id"],
      marketName: json["market_name"],
      marketNameRu: json["market_name_ru"],
      categoryId: json["category_id"],
      categoryName: json["category_name"],
      categoryNameRu: json["category_name_ru"],
      thumbnailUrl: json["thumbnail_url"],
      name: json["name"],
      nameRu: json["name_ru"],
      price: json["price"].toDouble(),
      discount: json["discount"],
      description: json["description"],
      descriptionRu: json["description_ru"],
      isNew: json["is_new"],
      finalPrice: json["final_price"].toDouble(),
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      isFavorite: json["is_favorite"],
      thumbnails:
          json["thumbnails"] == null
              ? []
              : List<dynamic>.from(json["thumbnails"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "market_id": marketId,
    "market_name": marketName,
    "market_name_ru": marketNameRu,
    "category_id": categoryId,
    "category_name": categoryName,
    "category_name_ru": categoryNameRu,
    "thumbnail_url": thumbnailUrl,
    "name": name,
    "name_ru": nameRu,
    "price": price,
    "discount": discount,
    "description": description,
    "description_ru": descriptionRu,
    "is_new": isNew,
    "final_price": finalPrice,
    "created_at": createdAt?.toIso8601String(),
    "is_favorite": isFavorite,
    "thumbnails": thumbnails.map((x) => x).toList(),
  };

  @override
  String toString() {
    return "$id, $marketId, $marketName, $marketNameRu, $categoryId, $categoryName, $categoryNameRu, $thumbnailUrl, $name, $nameRu, $price, $discount, $description, $descriptionRu, $isNew, $finalPrice, $createdAt, $isFavorite, $thumbnails, ";
  }
}

abstract class _ProductDataBase with Store {
  final int? id;
  final int? marketId;
  final String? marketName;
  final String? marketNameRu;
  final int? categoryId;
  final String? categoryName;
  final String? categoryNameRu;
  final String? thumbnailUrl;
  final String? name;
  final String? nameRu;
  final double? price;
  final int? discount;
  final String? description;
  final String? descriptionRu;
  final bool? isNew;
  final double? finalPrice;
  final DateTime? createdAt;
  @observable
   bool? isFavorite;
  final List<dynamic> thumbnails;
  _ProductDataBase({
    required this.id,
    required this.marketId,
    required this.marketName,
    required this.marketNameRu,
    required this.categoryId,
    required this.categoryName,
    required this.categoryNameRu,
    required this.thumbnailUrl,
    required this.name,
    required this.price,
    required this.discount,
    required this.description,
    required this.descriptionRu,
    required this.isNew,
    required this.finalPrice,
    required this.createdAt,
    required this.isFavorite,
    required this.nameRu,
    required this.thumbnails,
  });
}
