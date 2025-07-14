class CategoryData {
    CategoryData({
        required this.id,
        required this.name,
        required this.nameRu,
        required this.thumbnailUrl,
    });

    final int? id;
    final String? name;
    final String? nameRu;
    final String? thumbnailUrl;

    factory CategoryData.fromJson(Map<String, dynamic> json){ 
        return CategoryData(
            id: json["id"],
            name: json["name"],
            nameRu: json["name_ru"],
            thumbnailUrl: json["thumbnail_url"],
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "name_ru": nameRu,
        "thumbnail_url": thumbnailUrl,
    };

    @override
    String toString(){
        return "$id, $name, $nameRu, $thumbnailUrl, ";
    }
}
