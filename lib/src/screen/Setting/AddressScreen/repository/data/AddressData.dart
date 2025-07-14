class AddressPostData {
    AddressPostData({
        required this.locationAddress,
        required this.locationAddressRu,
        required this.locationName,
        required this.locationNameRu,
    });

    final String? locationAddress;
    final String? locationAddressRu;
    final String? locationName;
    final String? locationNameRu;

    factory AddressPostData.fromJson(Map<String, dynamic> json){ 
        return AddressPostData(
            locationAddress: json["location_address"],
            locationAddressRu: json["location_address_ru"],
            locationName: json["location_name"],
            locationNameRu: json["location_name_ru"],
        );
    }

    Map<String, dynamic> toJson() => {
        "location_address": locationAddress,
        "location_address_ru": locationAddressRu,
        "location_name": locationName,
        "location_name_ru": locationNameRu,
    };

    @override
    String toString(){
        return "$locationAddress, $locationAddressRu, $locationName, $locationNameRu, ";
    }
}
