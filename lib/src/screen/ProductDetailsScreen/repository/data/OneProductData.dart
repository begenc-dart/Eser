class OneProductData {
    OneProductData({
        required this.id,
        required this.marketId,
        required this.marketName,
        required this.marketNameRu,
        required this.categoryId,
        required this.categoryName,
        required this.categoryNameRu,
        required this.thumbnailUrl,
        required this.name,
        required this.nameRu,
        required this.price,
        required this.discount,
        required this.description,
        required this.descriptionRu,
        required this.isNew,
        required this.finalPrice,
        required this.createdAt,
        required this.isFavorite,
        required this.thumbnails,
    });

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
    final bool? isFavorite;
    final List<Thumbnail> thumbnails;

    factory OneProductData.fromJson(Map<String, dynamic> json){ 
        return OneProductData(
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
            thumbnails: json["thumbnails"] == null ? [] : List<Thumbnail>.from(json["thumbnails"]!.map((x) => Thumbnail.fromJson(x))),
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
        "thumbnails": thumbnails.map((x) => x?.toJson()).toList(),
    };

    @override
    String toString(){
        return "$id, $marketId, $marketName, $marketNameRu, $categoryId, $categoryName, $categoryNameRu, $thumbnailUrl, $name, $nameRu, $price, $discount, $description, $descriptionRu, $isNew, $finalPrice, $createdAt, $isFavorite, $thumbnails, ";
    }
}

class Thumbnail {
    Thumbnail({
        required this.id,
        required this.productId,
        required this.color,
        required this.colorRu,
        required this.imageUrl,
        required this.sizes,
    });

    final int? id;
    final int? productId;
    final String? color;
    final String? colorRu;
    final String? imageUrl;
    final List<Size> sizes;

    factory Thumbnail.fromJson(Map<String, dynamic> json){ 
        return Thumbnail(
            id: json["id"],
            productId: json["product_id"],
            color: json["color"],
            colorRu: json["color_ru"],
            imageUrl: json["image_url"],
            sizes: json["sizes"] == null ? [] : List<Size>.from(json["sizes"]!.map((x) => Size.fromJson(x))),
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "color": color,
        "color_ru": colorRu,
        "image_url": imageUrl,
        "sizes": sizes.map((x) => x?.toJson()).toList(),
    };

    @override
    String toString(){
        return "$id, $productId, $color, $colorRu, $imageUrl, $sizes, ";
    }
}

class Size {
    Size({
        required this.id,
        required this.thumbnailId,
        required this.size,
        required this.count,
        required this.price,
    });

    final int? id;
    final int? thumbnailId;
    final String? size;
    final int? count;
    final double? price;

    factory Size.fromJson(Map<String, dynamic> json){ 
        return Size(
            id: json["id"],
            thumbnailId: json["thumbnail_id"],
            size: json["size"],
            count: json["count"],
            price: json["price"].toDouble(),
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "thumbnail_id": thumbnailId,
        "size": size,
        "count": count,
        "price": price,
    };

    @override
    String toString(){
        return "$id, $thumbnailId, $size, $count, $price, ";
    }
}
