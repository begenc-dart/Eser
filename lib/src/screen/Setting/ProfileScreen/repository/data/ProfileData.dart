class ProfileData {
    ProfileData({
        required this.id,
        required this.fullName,
        required this.phone,
    });

    final int? id;
    final String? fullName;
    final String? phone;

    factory ProfileData.fromJson(Map<String, dynamic> json){ 
        return ProfileData(
            id: json["id"],
            fullName: json["full_name"],
            phone: json["phone"],
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "phone": phone,
    };

    @override
    String toString(){
        return "$id, $fullName, $phone, ";
    }
}
