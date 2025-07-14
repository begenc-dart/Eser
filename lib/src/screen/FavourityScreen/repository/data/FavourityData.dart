class FavourityData {
    FavourityData({
        required this.productId,
    });

    final int? productId;

    factory FavourityData.fromJson(Map<String, dynamic> json){ 
        return FavourityData(
            productId: json["product_id"],
        );
    }

    Map<String, dynamic> toJson() => {
        "product_id": productId,
    };

    @override
    String toString(){
        return "$productId, ";
    }
}
