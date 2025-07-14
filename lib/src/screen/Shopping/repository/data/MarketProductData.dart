import 'package:eser/src/utils/screen_export.dart';

class MarketProductData {
    MarketProductData({
        required this.market,
        required this.products,
    });

    final Market? market;
    final Products? products;

    factory MarketProductData.fromJson(Map<String, dynamic> json){ 
        return MarketProductData(
            market: json["market"] == null ? null : Market.fromJson(json["market"]),
            products: json["products"] == null ? null : Products.fromJson(json["products"]),
        );
    }

    Map<String, dynamic> toJson() => {
        "market": market?.toJson(),
        "products": products?.toJson(),
    };

    @override
    String toString(){
        return "$market, $products, ";
    }
}

class Market {
    Market({
        required this.id,
        required this.phone,
        required this.deliveryPrice,
        required this.name,
        required this.nameRu,
        required this.location,
        required this.locationRu,
        required this.thumbnailUrl,
        required this.isNew,
        required this.isVip,
    });

    final int? id;
    final String? phone;
    final int? deliveryPrice;
    final String? name;
    final String? nameRu;
    final String? location;
    final String? locationRu;
    final String? thumbnailUrl;
    final bool? isNew;
    final bool? isVip;

    factory Market.fromJson(Map<String, dynamic> json){ 
        return Market(
            id: json["id"],
            phone: json["phone"],
            deliveryPrice: json["delivery_price"],
            name: json["name"],
            nameRu: json["name_ru"],
            location: json["location"],
            locationRu: json["location_ru"],
            thumbnailUrl: json["thumbnail_url"],
            isNew: json["is_new"],
            isVip: json["is_vip"],
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "phone": phone,
        "delivery_price": deliveryPrice,
        "name": name,
        "name_ru": nameRu,
        "location": location,
        "location_ru": locationRu,
        "thumbnail_url": thumbnailUrl,
        "is_new": isNew,
        "is_vip": isVip,
    };

    @override
    String toString(){
        return "$id, $phone, $deliveryPrice, $name, $nameRu, $location, $locationRu, $thumbnailUrl, $isNew, $isVip, ";
    }
}

class Products {
    Products({
        required this.items,
        required this.limit,
        required this.page,
        required this.totalCount,
    });

    final List<ProductData> items;
    final int? limit;
    final int? page;
    final int? totalCount;

    factory Products.fromJson(Map<String, dynamic> json){ 
        return Products(
            items: json["items"] == null ? [] : List<ProductData>.from(json["items"]!.map((x) => ProductData.fromJson(x))),
            limit: json["limit"],
            page: json["page"],
            totalCount: json["total_count"],
        );
    }

    Map<String, dynamic> toJson() => {
        "items": items.map((x) => x?.toJson()).toList(),
        "limit": limit,
        "page": page,
        "total_count": totalCount,
    };

    @override
    String toString(){
        return "$items, $limit, $page, $totalCount, ";
    }
}
