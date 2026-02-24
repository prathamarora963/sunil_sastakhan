class HomeModel {
  bool? status;
  String? baseUrl;
  String? message;
  Data? data;

  HomeModel({this.status, this.baseUrl, this.message, this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    baseUrl = json['baseUrl'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['baseUrl'] = this.baseUrl;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<BannerData>? bannerData;
  List<ServiceData>? serviceData;
  List<TestimonialData>? testimonialData;
  List<DevelopersData>? developersData;
  VideoUrlData? videoUrlData;
  List<CuratedCollectionsData>? curatedCollectionsData;

  Data(
      {this.bannerData,
        this.serviceData,
        this.testimonialData,
        this.developersData,
        this.videoUrlData,
        this.curatedCollectionsData});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['banner_data'] != null) {
      bannerData = <BannerData>[];
      json['banner_data'].forEach((v) {
        bannerData!.add(new BannerData.fromJson(v));
      });
    }
    if (json['service_data'] != null) {
      serviceData = <ServiceData>[];
      json['service_data'].forEach((v) {
        serviceData!.add(new ServiceData.fromJson(v));
      });
    }
    if (json['testimonial_data'] != null) {
      testimonialData = <TestimonialData>[];
      json['testimonial_data'].forEach((v) {
        testimonialData!.add(new TestimonialData.fromJson(v));
      });
    }
    if (json['developers_data'] != null) {
      developersData = <DevelopersData>[];
      json['developers_data'].forEach((v) {
        developersData!.add(new DevelopersData.fromJson(v));
      });
    }
    videoUrlData = json['video_url_data'] != null
        ? new VideoUrlData.fromJson(json['video_url_data'])
        : null;
    if (json['curated_collections_data'] != null) {
      curatedCollectionsData = <CuratedCollectionsData>[];
      json['curated_collections_data'].forEach((v) {
        curatedCollectionsData!.add(new CuratedCollectionsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bannerData != null) {
      data['banner_data'] = this.bannerData!.map((v) => v.toJson()).toList();
    }
    if (this.serviceData != null) {
      data['service_data'] = this.serviceData!.map((v) => v.toJson()).toList();
    }
    if (this.testimonialData != null) {
      data['testimonial_data'] =
          this.testimonialData!.map((v) => v.toJson()).toList();
    }
    if (this.developersData != null) {
      data['developers_data'] =
          this.developersData!.map((v) => v.toJson()).toList();
    }
    if (this.videoUrlData != null) {
      data['video_url_data'] = this.videoUrlData!.toJson();
    }
    if (this.curatedCollectionsData != null) {
      data['curated_collections_data'] =
          this.curatedCollectionsData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BannerData {
  String? id;
  String? title;
  String? content;
  String? content1;
  String? image;
  String? image2;
  String? linkUrl;
  String? status;

  BannerData(
      {this.id,
        this.title,
        this.content,
        this.content1,
        this.image,
        this.image2,
        this.linkUrl,
        this.status});

  BannerData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    content1 = json['content1'];
    image = json['image'];
    image2 = json['image2'];
    linkUrl = json['link_url'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['content1'] = this.content1;
    data['image'] = this.image;
    data['image2'] = this.image2;
    data['link_url'] = this.linkUrl;
    data['status'] = this.status;
    return data;
  }
}

class ServiceData {
  String? id;
  String? teamName;
  String? year;
  String? image;
  String? designation;
  String? fUrl;
  String? facebookLink;
  String? instagramLink;
  String? status;

  ServiceData(
      {this.id,
        this.teamName,
        this.year,
        this.image,
        this.designation,
        this.fUrl,
        this.facebookLink,
        this.instagramLink,
        this.status});

  ServiceData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamName = json['team_name'];
    year = json['year'];
    image = json['image'];
    designation = json['designation'];
    fUrl = json['f_url'];
    facebookLink = json['facebook_link'];
    instagramLink = json['instagram_link'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['team_name'] = this.teamName;
    data['year'] = this.year;
    data['image'] = this.image;
    data['designation'] = this.designation;
    data['f_url'] = this.fUrl;
    data['facebook_link'] = this.facebookLink;
    data['instagram_link'] = this.instagramLink;
    data['status'] = this.status;
    return data;
  }
}

class TestimonialData {
  String? id;
  String? title;
  String? content;
  String? image;
  String? position;
  String? status;

  TestimonialData(
      {this.id,
        this.title,
        this.content,
        this.image,
        this.position,
        this.status});

  TestimonialData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    image = json['image'];
    position = json['position'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['image'] = this.image;
    data['position'] = this.position;
    data['status'] = this.status;
    return data;
  }
}

class DevelopersData {
  String? id;
  String? title;
  String? title2;
  String? image;
  String? status;

  DevelopersData({this.id, this.title, this.title2, this.image, this.status});

  DevelopersData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    title2 = json['title2'];
    image = json['image'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['title2'] = this.title2;
    data['image'] = this.image;
    data['status'] = this.status;
    return data;
  }
}

class VideoUrlData {
  String? id;
  String? logo;
  String? logo1;
  String? wel1;
  String? wel2;
  String? address;
  String? address2;
  String? account;
  String? mobile;
  String? rera;
  String? gst;
  String? email;
  String? email1;
  String? webname;
  String? opening;
  String? facebook;
  String? youtube;
  String? google;
  String? linkdin;
  String? instagram;
  String? twitter;
  String? homeyoutube;
  String? status;

  VideoUrlData(
      {this.id,
        this.logo,
        this.logo1,
        this.wel1,
        this.wel2,
        this.address,
        this.address2,
        this.account,
        this.mobile,
        this.rera,
        this.gst,
        this.email,
        this.email1,
        this.webname,
        this.opening,
        this.facebook,
        this.youtube,
        this.google,
        this.linkdin,
        this.instagram,
        this.twitter,
        this.homeyoutube,
        this.status});

  VideoUrlData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logo = json['logo'];
    logo1 = json['logo1'];
    wel1 = json['wel1'];
    wel2 = json['wel2'];
    address = json['address'];
    address2 = json['address2'];
    account = json['account'];
    mobile = json['mobile'];
    rera = json['rera'];
    gst = json['gst'];
    email = json['email'];
    email1 = json['email1'];
    webname = json['webname'];
    opening = json['opening'];
    facebook = json['facebook'];
    youtube = json['youtube'];
    google = json['google'];
    linkdin = json['linkdin'];
    instagram = json['instagram'];
    twitter = json['twitter'];
    homeyoutube = json['homeyoutube'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['logo'] = this.logo;
    data['logo1'] = this.logo1;
    data['wel1'] = this.wel1;
    data['wel2'] = this.wel2;
    data['address'] = this.address;
    data['address2'] = this.address2;
    data['account'] = this.account;
    data['mobile'] = this.mobile;
    data['rera'] = this.rera;
    data['gst'] = this.gst;
    data['email'] = this.email;
    data['email1'] = this.email1;
    data['webname'] = this.webname;
    data['opening'] = this.opening;
    data['facebook'] = this.facebook;
    data['youtube'] = this.youtube;
    data['google'] = this.google;
    data['linkdin'] = this.linkdin;
    data['instagram'] = this.instagram;
    data['twitter'] = this.twitter;
    data['homeyoutube'] = this.homeyoutube;
    data['status'] = this.status;
    return data;
  }
}

class CuratedCollectionsData {
  String? id;
  String? title;
  String? imgUrl;

  CuratedCollectionsData({this.id,this.title, this.imgUrl});

  CuratedCollectionsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    imgUrl = json['img_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['img_url'] = this.imgUrl;
    return data;
  }
}