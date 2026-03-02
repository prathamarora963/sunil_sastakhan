class ItemDetailsModel {
    ItemDetailsModel({
        required this.id,
        required this.userId,
        required this.itemName,
        required this.itemDescription,
        required this.category,
        required this.numberOfItme,
        required this.price,
        required this.pickupTimeFrom,
        required this.pickupTimeTo,
        required this.itemStatue,
        required this.superDiscount,
        required this.superDiscountPrice,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.categoryName,
        required this.itemsImage,
    });

    final String? id;
    final String? userId;
    final String? itemName;
    final String? itemDescription;
    final String? category;
    final String? numberOfItme;
    final String? price;
    final String? pickupTimeFrom;
    final String? pickupTimeTo;
    final String? itemStatue;
    final String? superDiscount;
    final String? superDiscountPrice;
    final String? status;
    final dynamic createdAt;
    final dynamic updatedAt;
    final String? categoryName;
    final List<ItemsImage> itemsImage;

    factory ItemDetailsModel.fromJson(Map<String, dynamic> json){ 
        return ItemDetailsModel(
            id: json["id"],
            userId: json["user_id"],
            itemName: json["itemName"],
            itemDescription: json["itemDescription"],
            category: json["category"],
            numberOfItme: json["numberOfItme"],
            price: json["price"],
            pickupTimeFrom: json["pickupTimeFrom"],
            pickupTimeTo: json["pickupTimeTo"],
            itemStatue: json["ItemStatue"],
            superDiscount: json["superDiscount"],
            superDiscountPrice: json["superDiscountPrice"],
            status: json["status"],
            createdAt: json["created_at"],
            updatedAt: json["updated_at"],
            categoryName: json["category_name"],
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
