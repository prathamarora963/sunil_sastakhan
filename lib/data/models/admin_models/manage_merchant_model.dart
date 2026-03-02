class ManageMerchantModel {
  ManageMerchantModel({
    required this.id,
    required this.fName,
    required this.image,
    required this.address,
    required this.zip,
    required this.email,
    required this.contactPerson,
    required this.mobile,
    required this.stateName,
    required this.cityName,
  });

  final String? id;
  final String? fName;
  final String? image;
  final String? address;
  final String? zip;
  final String? email;
  final String? contactPerson;
  final String? mobile;
  final String? stateName;
  final String? cityName;

  factory ManageMerchantModel.fromJson(Map<String, dynamic> json) {
    return ManageMerchantModel(
      id: json["id"],
      fName: json["f_name"],
      image: json["image"],
      address: json["address"],
      zip: json["zip"],
      email: json["email"],
      contactPerson: json["contactPerson"],
      mobile: json["mobile"],
      stateName: json["state_name"],
      cityName: json["city_name"],
    );
  }
}

class ManageMerchantRequest {
  final String search;
  final String verifyStatus;
  final int pageNo;

  const ManageMerchantRequest({
    this.search = "",
    this.verifyStatus = "0",
    this.pageNo = 1,
  });

  Map<String, dynamic> toJson() {
    return {
      "search": search,
      "verify_status": verifyStatus,
      "pageNo": pageNo.toString(),
    };
  }
}
