class BannerData {
    BannerData({
        required this.id,
        required this.description,
        required this.thumbnailUrl,
    });

    final int? id;
    final String? description;
    final String? thumbnailUrl;

    factory BannerData.fromJson(Map<String, dynamic> json){ 
        return BannerData(
            id: json["id"],
            description: json["description"],
            thumbnailUrl: json["thumbnail_url"],
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "thumbnail_url": thumbnailUrl,
    };

    @override
    String toString(){
        return "$id, $description, $thumbnailUrl, ";
    }
}
