class ManageUserModel {
  ManageUserModel({
    required this.id,
    required this.fName,
    required this.image,
    required this.email,
    required this.mobile,
  });

  final String? id;
  final String? fName;
  final String? image;
  final String? email;
  final String? mobile;

  factory ManageUserModel.fromJson(Map<String, dynamic> json) {
    return ManageUserModel(
      id: json["id"],
      fName: json["f_name"],
      image: json["image"],
      email: json["email"],
      mobile: json["mobile"],
    );
  }
}

class ManageUserRequest {
  final String search;
  final int pageNo;

  const ManageUserRequest({this.search = "", this.pageNo = 1});

  Map<String, dynamic> toJson() {
    return {"search": search, "pageNo": pageNo.toString()};
  }
}
