class MarketData {
    MarketData({
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

    factory MarketData.fromJson(Map<String, dynamic> json){ 
        return MarketData(
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
