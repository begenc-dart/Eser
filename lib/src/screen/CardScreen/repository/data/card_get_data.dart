import 'package:mobx/mobx.dart';
part 'card_get_data.g.dart';


class CardGetData extends _CardGetDataBase with _$CardGetData{
    CardGetData({
         int? marketId,
     String? marketName,
     String? marketNameRu,
     double? deliveryPrice,
     int? userId,
     double sum=0,
     int? cartId,

     ObservableList<Product>? products
    }):super(
      marketId:marketId,
       marketName:marketName,
       marketNameRu:marketNameRu,
       deliveryPrice:deliveryPrice,
       userId:userId,
       cartId:cartId,
     sum: sum!,
      products:      products!
    );

   

    factory CardGetData.fromJson(Map<String, dynamic> json){ 
        return CardGetData(
            marketId: json["market_id"],
            marketName: json["market_name"],
            marketNameRu: json["market_name_ru"],
            deliveryPrice: json["delivery_price"].toDouble(),
            userId: json["user_id"],
            cartId: json["cart_id"],
            products: json["products"] == null
        ? ObservableList.of([])
        : ObservableList.of(
            (json["products"] as List).map((x) => Product.fromJson(x)).toList(),
        ));
    }

    Map<String, dynamic> toJson() => {
        "market_id": marketId,
        "market_name": marketName,
        "market_name_ru": marketNameRu,
        "delivery_price": deliveryPrice,
        "user_id": userId,
        "cart_id": cartId,
        "products": products!.map((x) => x?.toJson()).toList(),
    };

    @override
    String toString(){
        return "$marketId, $marketName, $marketNameRu, $deliveryPrice, $userId, $cartId, $products, ";
    }
}
abstract class _CardGetDataBase with Store{
final int? marketId;
 final    String? marketName;
   final  String? marketNameRu;
   final  double? deliveryPrice;
   final  int? userId;
  final   int? cartId;
  @observable
  double sum=0;
  @observable
   ObservableList<Product> products;
   _CardGetDataBase({
  required  this.marketId,
  required this.sum,
  required  this.cartId,
 required   this.deliveryPrice,
  required  this.marketName,
  required  this.marketNameRu,
  required  this.products,
 required   this.userId
   });
}
class Product extends _ProductBase with _$Product{
    Product({
          int? sizeId,
    required int? productId,
    required String? thumbnailUrl,
    required String? name,
    required String? nameRu,
    required double? price,
    required int? discount,
    required String? color,
    required String? colorRu,
    required String? size,
    required double? sizePrice,
    required double? sum,
    required int? count,
      
    }):super(
        sizeId:sizeId,
        productId:productId,
        thumbnailUrl:thumbnailUrl,
        name:        name,
        nameRu:nameRu,
        price:        price,
        discount:discount,
        color:color,
        colorRu:        colorRu,
        size:size,
        sizePrice:sizePrice,
        sum:sum,
        count:count,
    );

 

    factory Product.fromJson(Map<String, dynamic> json){ 
        return Product(
            sizeId: json["size_id"],
            productId: json["product_id"],
            thumbnailUrl: json["thumbnail_url"],
            name: json["name"],
            nameRu: json["name_ru"],
            price: json["price"].toDouble(),
            discount: json["discount"],
            color: json["color"],
            colorRu: json["color_ru"],
            size: json["size"],
            sizePrice: json["size_price"].toDouble(),
            sum: json["sum"].toDouble(),
            count: json["count"],
        );
    }

    Map<String, dynamic> toJson() => {
        "size_id": sizeId,
        "product_id": productId,
        "thumbnail_url": thumbnailUrl,
        "name": name,
        "name_ru": nameRu,
        "price": price,
        "discount": discount,
        "color": color,
        "color_ru": colorRu,
        "size": size,
        "size_price": sizePrice,
        "sum": sum,
        "count": count,
    };

    @override
    String toString(){
        return "$sizeId, $productId, $thumbnailUrl, $name, $nameRu, $price, $discount, $color, $colorRu, $size, $sizePrice, $sum, $count, ";
    }
}

abstract class _ProductBase with Store {
  final int? sizeId;
    final int? productId;
    final String? thumbnailUrl;
    final String? name;
    final String? nameRu;
    final double? price;
    final int? discount;
    final String? color;
    final String? colorRu;
    final String? size;
    final double? sizePrice;
    @observable
    double? sum;
    @observable
     int? count;
  _ProductBase({
  required  this.sizeId,
   required this.productId,
   required this.thumbnailUrl,
   required this.name,
   required this.nameRu,
   required this.color,
   required this.colorRu,
   required this.count,
  required  this.discount,
   required this.price,
   required this.size,
   required this.sizePrice,
   required this.sum
  });
}
