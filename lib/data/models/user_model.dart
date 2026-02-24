class UserModel {
  dynamic id;
  dynamic role;
  dynamic name;
  dynamic email;
  dynamic password;
  dynamic socialId;
  dynamic deviceToken;
  dynamic lawnMessageEn;
  dynamic dairyNote;
  dynamic lawnMessageDe;
  dynamic description;
  dynamic title;
  dynamic loginTime;
  dynamic deviceType;
  dynamic language;
  dynamic isSurvey;
  dynamic packageId;
  dynamic location;
  dynamic latitude;
  dynamic longitude;
  dynamic upperWater;
  dynamic lowerWater;
  dynamic countryCode;
  dynamic zipCode;
  dynamic status;
  dynamic socialType;
  dynamic notificationStatus;
  dynamic instagramLink;
  dynamic facebookLink;
  dynamic youtubeLink;
  dynamic twitterLink;
  dynamic subscribe;
  dynamic link;
  dynamic productId;
  dynamic newsLatter;
  dynamic phoneNumber;
  dynamic bio;
  dynamic isOtpVerified;
  dynamic otp;
  dynamic image;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  dynamic token;
  dynamic type;
  dynamic isRainNotification;
  dynamic isWaterNotification;
  dynamic contentEn;
  dynamic contentDe;
  dynamic isZipCode;
  dynamic lawnSize;
  dynamic waterRequired;
  List<Suggestions>? suggestions;

  UserModel({
    this.id,
    this.role,
    this.description,
    this.name,
    this.email,
    this.password,
    this.isSurvey,
    this.latitude,
    this.lawnSize,
    this.isRainNotification,
    this.longitude,
    this.isWaterNotification,
    this.socialId,
    this.productId,
    this.deviceToken,
    this.lowerWater,
    this.facebookLink,
    this.upperWater,
    this.instagramLink,
    this.youtubeLink,
    this.packageId,
    this.suggestions,
    this.twitterLink,
    this.lawnMessageEn,
    this.loginTime,
    this.title,
    this.deviceType,
    this.language,
    this.location,
    this.countryCode,
    this.zipCode,
    this.status,
    this.socialType,
    this.notificationStatus,
    this.subscribe,
    this.lawnMessageDe,
    this.link,
    this.newsLatter,
    this.phoneNumber,
    this.bio,
    this.isOtpVerified,
    this.otp,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.token,
    this.dairyNote,
    this.type,
    this.contentEn,
    this.contentDe,
    this.isZipCode,
    this.waterRequired,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    role = json['role'];
    name = json['name'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    lawnSize = json['lawn_size'];
    email = json['email'];
    isRainNotification = json['is_rain_noti'];
    isWaterNotification = json['is_cron_noti'];
    password = json['password'];
    description = json['description'];
    packageId = json['package_id'];
    productId = json['product_id'];
    isSurvey = json['is_survey'];
    dairyNote = json['dairy_note'];
    socialId = json['social_id'];
    upperWater = json['upper_water'];
    facebookLink = json['facebook_link'];
    instagramLink = json['instagram_link'];
    twitterLink = json['twitter_link'];
    youtubeLink = json['you_tube_link'];
    deviceToken = json['device_token'];
    loginTime = json['login_time'];
    deviceType = json['device_type'];
    title = json['title'];
    lowerWater = json['lower_water'];
    language = json['language'];
    lawnMessageEn = json['lawn_message_en'];
    location = json['location'];
    lawnMessageDe = json['lawn_message_de'];
    countryCode = json['country_code'];
    zipCode = json['zip_code'];
    status = json['status'];
    socialType = json['social_type'];
    notificationStatus = json['notification_status'];
    subscribe = json['subscribe'];
    link = json['link'];
    newsLatter = json['news_latter'];
    phoneNumber = json['phone_number'];
    bio = json['bio'];
    isOtpVerified = json['is_otp_verified'];
    otp = json['otp'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    token = json['token'];
    type = json['type'];
    contentEn = json['content_en'];
    contentDe = json['content_de'];
    isZipCode = json['is_zip_code'];
    waterRequired = json['water_required'];
    if (json['suggestions'] != null) {
      suggestions = <Suggestions>[];
      json['suggestions'].forEach((v) {
        suggestions!.add(new Suggestions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['role'] = role;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['lawn_message_de'] = lawnMessageDe;
    data['product_id'] = productId;
    data['is_cron_noti'] = isWaterNotification;
    data['dairy_note'] = dairyNote;
    data['is_survey'] = isSurvey;
    data['package_id'] = packageId;
    data['lawn_size'] = lawnSize;
    data['social_id'] = socialId;
    data['title'] = title;
    data['twitter_link'] = twitterLink;
    data['is_rain_noti'] = isRainNotification;
    data['you_tube_link'] = youtubeLink;
    data['description'] = description;
    data['upper_water'] = upperWater;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['facebook_link'] = facebookLink;
    data['instagram_link'] = instagramLink;
    data['lower_water'] = lowerWater;
    data['device_token'] = deviceToken;
    data['lawn_message_en'] = lawnMessageEn;
    data['login_time'] = loginTime;
    data['device_type'] = deviceType;
    data['language'] = language;
    data['location'] = location;
    data['country_code'] = countryCode;
    data['zip_code'] = zipCode;
    data['status'] = status;
    data['social_type'] = socialType;
    data['notification_status'] = notificationStatus;
    data['subscribe'] = subscribe;
    data['link'] = link;
    data['news_latter'] = newsLatter;
    data['phone_number'] = phoneNumber;
    data['bio'] = bio;
    data['is_otp_verified'] = isOtpVerified;
    data['otp'] = otp;
    data['image'] = image;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    data['token'] = token;
    data['type'] = type;
    data['content_en'] = contentEn;
    data['content_de'] = contentDe;
    data['is_zip_code'] = isZipCode;
    data['water_required'] = waterRequired;
    if (this.suggestions != null) {
      data['suggestions'] = this.suggestions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Suggestions {
  dynamic id;
  dynamic type;
  dynamic startMonth;
  dynamic startMonthDe;
  dynamic endMonth;
  dynamic endMonthDe;
  dynamic lowerTemp;
  dynamic upperTemp;
  dynamic lowerWater;
  dynamic upperWater;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  Suggestions({
    this.id,
    this.type,
    this.startMonth,
    this.endMonth,
    this.lowerTemp,
    this.upperTemp,
    this.lowerWater,
    this.startMonthDe,
    this.upperWater,
    this.status,
    this.endMonthDe,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  Suggestions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    startMonth = json['start_month'];
    startMonthDe = json['startMonthDe'];
    endMonth = json['end_month'];
    endMonthDe = json['endMonthDe'];
    lowerTemp = json['lower_temp'];
    upperTemp = json['upper_temp'];
    lowerWater = json['lower_water'];
    upperWater = json['upper_water'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['start_month'] = this.startMonth;
    data['end_month'] = this.endMonth;
    data['startMonthDe'] = this.startMonthDe;
    data['lower_temp'] = this.lowerTemp;
    data['upper_temp'] = this.upperTemp;
    data['lower_water'] = this.lowerWater;
    data['upper_water'] = this.upperWater;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['endMonthDe'] = this.endMonthDe;
    data['deletedAt'] = this.deletedAt;
    return data;
  }
}
