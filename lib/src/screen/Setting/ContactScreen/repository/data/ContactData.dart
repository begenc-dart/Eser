class ContactData {
    ContactData({
        required this.fullName,
        required this.message,
        required this.phone,
    });

    final String? fullName;
    final String? message;
    final String? phone;

    factory ContactData.fromJson(Map<String, dynamic> json){ 
        return ContactData(
            fullName: json["full_name"],
            message: json["message"],
            phone: json["phone"],
        );
    }

    Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "message": message,
        "phone": phone,
    };

    @override
    String toString(){
        return "$fullName, $message, $phone, ";
    }
}
