class HistoryData {
    HistoryData({
        required this.cartOrderId,
        required this.marketName,
        required this.marketNameRu,
        required this.status,
        required this.sum,
        required this.products,
    });

    final int? cartOrderId;
    final String? marketName;
    final String? marketNameRu;
    final String? status;
    final int? sum;
    final List<HistoryProducts> products;

    factory HistoryData.fromJson(Map<String, dynamic> json){ 
        return HistoryData(
            cartOrderId: json["cart_order_id"],
            marketName: json["market_name"],
            marketNameRu: json["market_name_ru"],
            status: json["status"],
            sum: json["sum"],
            products: json["products"] == null ? [] : List<HistoryProducts>.from(json["products"]!.map((x) => HistoryProducts.fromJson(x))),
        );
    }

    Map<String, dynamic> toJson() => {
        "cart_order_id": cartOrderId,
        "market_name": marketName,
        "market_name_ru": marketNameRu,
        "status": status,
        "sum": sum,
        "products": products.map((x) => x?.toJson()).toList(),
    };

    @override
    String toString(){
        return "$cartOrderId, $marketName, $marketNameRu, $status, $sum, $products, ";
    }
}

class HistoryProducts {
    HistoryProducts({
        required this.productName,
        required this.productNameRu,
        required this.size,
        required this.color,
        required this.colorRu,
        required this.imageUrl,
        required this.createdAt,
    });

    final String? productName;
    final String? productNameRu;
    final String? size;
    final String? color;
    final String? colorRu;
    final String? imageUrl;
    final DateTime? createdAt;

    factory HistoryProducts.fromJson(Map<String, dynamic> json){ 
        return HistoryProducts(
            productName: json["product_name"],
            productNameRu: json["product_name_ru"],
            size: json["size"],
            color: json["color"],
            colorRu: json["color_ru"],
            imageUrl: json["image_url"],
            createdAt: DateTime.tryParse(json["created_at"] ?? ""),
        );
    }

    Map<String, dynamic> toJson() => {
        "product_name": productName,
        "product_name_ru": productNameRu,
        "size": size,
        "color": color,
        "color_ru": colorRu,
        "image_url": imageUrl,
        "created_at": createdAt?.toIso8601String(),
    };

    @override
    String toString(){
        return "$productName, $productNameRu, $size, $color, $colorRu, $imageUrl, $createdAt, ";
    }
}
