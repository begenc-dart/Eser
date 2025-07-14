class OrderData {
    OrderData({
        required this.locationId,
        required this.name,
        required this.notes,
        required this.phone,
    });

    final int? locationId;
    final String? name;
    final String? notes;
    final String? phone;

    factory OrderData.fromJson(Map<String, dynamic> json){ 
        return OrderData(
            locationId: json["location_id"],
            name: json["name"],
            notes: json["notes"],
            phone: json["phone"],
        );
    }

    Map<String, dynamic> toJson() => {
        "location_id": locationId,
        "name": name,
        "notes": notes,
        "phone": phone,
    };

    @override
    String toString(){
        return "$locationId, $name, $notes, $phone, ";
    }
}
