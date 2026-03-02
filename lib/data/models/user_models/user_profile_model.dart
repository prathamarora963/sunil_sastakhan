class UserProfileModel {
    UserProfileModel({
        required this.id,
        required this.fName,
        required this.address,
        required this.mobile,
        required this.email,
        required this.image,
    });

    final String? id;
    final String? fName;
    final String? address;
    final String? mobile;
    final String? email;
    final String? image;

    factory UserProfileModel.fromJson(Map<String, dynamic> json){ 
        return UserProfileModel(
            id: json["id"],
            fName: json["f_name"],
            address: json["address"],
            mobile: json["mobile"],
            email: json["email"],
            image: json["image"],
        );
    }

}
