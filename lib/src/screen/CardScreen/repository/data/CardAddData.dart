class CardDataPost {
    CardDataPost({
        required this.count,
        required this.productId,
         this.sizeId,
         this.thumbnailId,
    });

    final int? count;
    final int? productId;
    final int? sizeId;
    final int? thumbnailId;

    factory CardDataPost.fromJson(Map<String, dynamic> json){ 
        return CardDataPost(
            count: json["count"],
            productId: json["product_id"],
            sizeId: json["size_id"],
            thumbnailId: json["thumbnail_id"],
        );
    }

    Map<String, dynamic> toJson() => {
        "count": count,
        "product_id": productId,
        "size_id": sizeId,
        "thumbnail_id": thumbnailId,
    };

    @override
    String toString(){
        return "$count, $productId, $sizeId, $thumbnailId, ";
    }
}
class CardPutData {
    CardPutData({
        required this.countChange,
        required this.sized_id
    });

    final int? countChange;
    int sized_id;
    factory CardPutData.fromJson(Map<String, dynamic> json){ 
        return CardPutData(
            countChange: json["count_change"], sized_id: 0,
        );
    }

    Map<String, dynamic> toJson() => {
        "count_change": countChange,
    };

    @override
    String toString(){
        return "$countChange, ";
    }
}
