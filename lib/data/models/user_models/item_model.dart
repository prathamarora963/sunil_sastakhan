class ItemModel {
    ItemModel({
        required this.merchantId,
        required this.merchantName,
        required this.itemId,
        required this.itemName,
        required this.price,
        required this.superDiscountPrice,
        required this.itemsImage,
    });

    final String? merchantId;
    final String? merchantName;
    final String? itemId;
    final String? itemName;
    final String? price;
    final String? superDiscountPrice;
    final List<ItemsImage> itemsImage;

    factory ItemModel.fromJson(Map<String, dynamic> json){ 
        return ItemModel(
            merchantId: json["merchant_id"],
            merchantName: json["merchant_name"],
            itemId: json["item_id"],
            itemName: json["itemName"],
            price: json["price"],
            superDiscountPrice: json["superDiscountPrice"],
            itemsImage: json["items_image"] == null ? [] : List<ItemsImage>.from(json["items_image"]!.map((x) => ItemsImage.fromJson(x))),
        );
    }

}

class ItemsImage {
    ItemsImage({
        required this.id,
        required this.itemsId,
        required this.image,
        required this.createdAt,
        required this.updatedAt,
    });

    final String? id;
    final String? itemsId;
    final String? image;
    final DateTime? createdAt;
    final dynamic updatedAt;

    factory ItemsImage.fromJson(Map<String, dynamic> json){ 
        return ItemsImage(
            id: json["id"],
            itemsId: json["items_id"],
            image: json["image"],
            createdAt: DateTime.tryParse(json["created_at"] ?? ""),
            updatedAt: json["updated_at"],
        );
    }

}


class HomeRequest{
  final int pageNo;
  HomeRequest({
    required this.pageNo,
  });
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pageNo'] = pageNo;
    return data;
}}