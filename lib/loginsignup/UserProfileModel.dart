class UserProfileModel {
  bool? status;
  String? baseUrl;
  UserData? userData;

  UserProfileModel({this.status, this.baseUrl, this.userData});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    baseUrl = json['baseUrl'];
    userData = json['user_data'] != null
        ? new UserData.fromJson(json['user_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['baseUrl'] = this.baseUrl;
    if (this.userData != null) {
      data['user_data'] = this.userData!.toJson();
    }
    return data;
  }
}

class UserData {
  String? id;
  String? fName;
  String? lName;
  String? walletBalance;
  String? userType;
  String? userOtp;
  String? catId;
  String? subcatId;
  String? organization;
  String? shippingAddress;
  String? billingAddress;
  String? email;
  String? trmcon;
  String? mobile;
  String? categoryType;
  String? image;
  String? password;
  String? cPassword;
  String? status;
  String? active;
  String? createdBy;
  String? createdDate;
  String? updatedBy;
  String? updatedDate;
  String? addressLineOne;
  String? addressLineTwo;
  String? state;
  String? city;
  String? zip;
  String? country;
  String? agent;
  String? deviceId;
  String? deviceType;

  UserData(
      {this.id,
        this.fName,
        this.lName,
        this.walletBalance,
        this.userType,
        this.userOtp,
        this.catId,
        this.subcatId,
        this.organization,
        this.shippingAddress,
        this.billingAddress,
        this.email,
        this.trmcon,
        this.mobile,
        this.categoryType,
        this.image,
        this.password,
        this.cPassword,
        this.status,
        this.active,
        this.createdBy,
        this.createdDate,
        this.updatedBy,
        this.updatedDate,
        this.addressLineOne,
        this.addressLineTwo,
        this.state,
        this.city,
        this.zip,
        this.country,
        this.agent,
        this.deviceId,
        this.deviceType});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fName = json['f_name'];
    lName = json['l_name'];
    walletBalance = json['wallet_balance'];
    userType = json['user_type'];
    userOtp = json['user_otp'];
    catId = json['cat_id'];
    subcatId = json['subcat_id'];
    organization = json['organization'];
    shippingAddress = json['shipping_address'];
    billingAddress = json['billing_address'];
    email = json['email'];
    trmcon = json['trmcon'];
    mobile = json['mobile'];
    categoryType = json['category_type'];
    image = json['image'];
    password = json['password'];
    cPassword = json['c_password'];
    status = json['status'];
    active = json['active'];
    createdBy = json['created_by'];
    createdDate = json['created_date'];
    updatedBy = json['updated_by'];
    updatedDate = json['updated_date'];
    addressLineOne = json['address_line_one'];
    addressLineTwo = json['address_line_two'];
    state = json['state'];
    city = json['city'];
    zip = json['zip'];
    country = json['country'];
    agent = json['agent'];
    deviceId = json['deviceId'];
    deviceType = json['deviceType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['wallet_balance'] = this.walletBalance;
    data['user_type'] = this.userType;
    data['user_otp'] = this.userOtp;
    data['cat_id'] = this.catId;
    data['subcat_id'] = this.subcatId;
    data['organization'] = this.organization;
    data['shipping_address'] = this.shippingAddress;
    data['billing_address'] = this.billingAddress;
    data['email'] = this.email;
    data['trmcon'] = this.trmcon;
    data['mobile'] = this.mobile;
    data['category_type'] = this.categoryType;
    data['image'] = this.image;
    data['password'] = this.password;
    data['c_password'] = this.cPassword;
    data['status'] = this.status;
    data['active'] = this.active;
    data['created_by'] = this.createdBy;
    data['created_date'] = this.createdDate;
    data['updated_by'] = this.updatedBy;
    data['updated_date'] = this.updatedDate;
    data['address_line_one'] = this.addressLineOne;
    data['address_line_two'] = this.addressLineTwo;
    data['state'] = this.state;
    data['city'] = this.city;
    data['zip'] = this.zip;
    data['country'] = this.country;
    data['agent'] = this.agent;
    data['deviceId'] = this.deviceId;
    data['deviceType'] = this.deviceType;
    return data;
  }
}