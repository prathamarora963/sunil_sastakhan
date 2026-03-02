
class MerchantDetailsModel {
    MerchantDetailsModel({
        required this.id,
        required this.fName,
        required this.address,
        required this.mobile,
        required this.email,
        required this.image,
        required this.agent,
        required this.active,
        required this.contactPerson,
        required this.fssaiDoc,
        required this.merchantIdentity,
        required this.panCard,
        required this.otherDoc,
        required this.stateName,
        required this.cityName,
        required this.businessTiming,
        required this.shopImage,
    });

    final String? id;
    final String? fName;
    final String? address;
    final String? mobile;
    final String? email;
    final String? image;
    final String? agent;
    final String? active;
    final String? contactPerson;
    final String? fssaiDoc;
    final dynamic merchantIdentity;
    final dynamic panCard;
    final dynamic otherDoc;
    final String? stateName;
    final String? cityName;
    final List<BusinessTiming> businessTiming;
    final List<ShopImage> shopImage;

    factory MerchantDetailsModel.fromJson(Map<String, dynamic> json){ 
        return MerchantDetailsModel(
            id: json["id"],
            fName: json["f_name"],
            address: json["address"],
            mobile: json["mobile"],
            email: json["email"],
            image: json["image"],
            agent: json["agent"],
            active: json["active"],
            contactPerson: json["contactPerson"],
            fssaiDoc: json["fssai_doc"],
            merchantIdentity: json["merchant_identity"],
            panCard: json["pan_card"],
            otherDoc: json["other_doc"],
            stateName: json["state_name"],
            cityName: json["city_name"],
            businessTiming: json["business_timing"] == null ? [] : List<BusinessTiming>.from(json["business_timing"]!.map((x) => BusinessTiming.fromJson(x))),
            shopImage: json["shop_image"] == null ? [] : List<ShopImage>.from(json["shop_image"]!.map((x) => ShopImage.fromJson(x))),
        );
    }

}

class BusinessTiming {
    BusinessTiming({
        required this.id,
        required this.userId,
        required this.day,
        required this.fromTiming,
        required this.toTiming,
        required this.createdAt,
        required this.updatedAt,
    });

    final String? id;
    final String? userId;
    final String? day;
    final String? fromTiming;
    final String? toTiming;
    final DateTime? createdAt;
    final dynamic updatedAt;

    factory BusinessTiming.fromJson(Map<String, dynamic> json){ 
        return BusinessTiming(
            id: json["id"],
            userId: json["user_id"],
            day: json["day"],
            fromTiming: json["from_timing"],
            toTiming: json["to_timing"],
            createdAt: DateTime.tryParse(json["created_at"] ?? ""),
            updatedAt: json["updated_at"],
        );
    }

}

class ShopImage {
    ShopImage({
        required this.id,
        required this.userId,
        required this.imageName,
        required this.createdAt,
        required this.updatedAt,
    });

    final String? id;
    final String? userId;
    final String? imageName;
    final DateTime? createdAt;
    final dynamic updatedAt;

    factory ShopImage.fromJson(Map<String, dynamic> json){ 
        return ShopImage(
            id: json["id"],
            userId: json["user_id"],
            imageName: json["image_name"],
            createdAt: DateTime.tryParse(json["created_at"] ?? ""),
            updatedAt: json["updated_at"],
        );
    }

}
