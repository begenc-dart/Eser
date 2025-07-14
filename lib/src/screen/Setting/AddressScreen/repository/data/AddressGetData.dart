class AddressGetData {
    AddressGetData({
        required this.id,
        required this.userId,
        required this.locationName,
        required this.locationNameRu,
        required this.locationAddress,
        required this.locationAddressRu,
    });

    final int? id;
    final int? userId;
    final String? locationName;
    final String? locationNameRu;
    final String? locationAddress;
    final String? locationAddressRu;

    factory AddressGetData.fromJson(Map<String, dynamic> json){ 
        return AddressGetData(
            id: json["id"],
            userId: json["user_id"],
            locationName: json["location_name"],
            locationNameRu: json["location_name_ru"],
            locationAddress: json["location_address"],
            locationAddressRu: json["location_address_ru"],
        );
    }
    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "location_name": locationName,
        "location_name_ru": locationNameRu,
        "location_address": locationAddress,
        "location_address_ru": locationAddressRu,
    };
    @override
    String toString(){
        return "$id, $userId, $locationName, $locationNameRu, $locationAddress, $locationAddressRu, ";
    }
}
