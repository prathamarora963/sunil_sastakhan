// To parse this JSON data, do
//
//     final scannerDetailResponse = scannerDetailResponseFromJson(jsonString);

import 'dart:convert';

ScannerDetailResponse scannerDetailResponseFromJson(String str) => ScannerDetailResponse.fromJson(json.decode(str));

String scannerDetailResponseToJson(ScannerDetailResponse data) => json.encode(data.toJson());

class ScannerDetailResponse {
  ScannerDetailResponse({
    this.id,
    this.equipmentId,
    this.tagId,
    this.tagStatusId,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.createdAt,
    this.updatedAt,
    this.locationId,
    this.tagQr,
    this.equipment,
    this.tag,
    this.tagStatus,
    this.tagImages,
  });

  int? id;
  String? equipmentId;
  String? tagId;
  String? tagStatusId;
  dynamic createdBy;
  String? updatedBy;
  dynamic deletedBy;
  String? createdAt;
  String? updatedAt;
  dynamic locationId;
  TagQr? tagQr;
  Equipment? equipment;
  Tag? tag;
  TagStatus? tagStatus;
  List<TagImage>? tagImages;

  factory ScannerDetailResponse.fromJson(Map<String, dynamic> json) => ScannerDetailResponse(
    id: json["id"],
    equipmentId: json["equipment_id"],
    tagId: json["tag_id"],
    tagStatusId: json["tag_status_id"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    deletedBy: json["deleted_by"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    locationId: json["location_id"],
    tagQr: json.containsKey("tag_qr")&&json["tag_qr"]!=null? TagQr.fromJson(json["tag_qr"]):TagQr(),
    equipment:json["equipment"]!=null? Equipment.fromJson(json["equipment"]):null,
    tag: json["tag"]!=null?Tag.fromJson(json["tag"]):null,
    tagStatus: json["tag_status"]!=null?TagStatus.fromJson(json["tag_status"]):null,
    tagImages: List<TagImage>.from(json["tag_images"].map((x) => TagImage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "equipment_id": equipmentId,
    "tag_id": tagId,
    "tag_status_id": tagStatusId,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "deleted_by": deletedBy,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "location_id": locationId,
    "tag_qr": tagQr!.toJson(),
    "equipment": equipment!.toJson(),
    "tag": tag!.toJson(),
    "tag_status": tagStatus!.toJson(),
    "tag_images": List<dynamic>.from(tagImages!.map((x) => x.toJson())),
  };
}

class Equipment {
  Equipment({
    this.id,
    this.moduleId,
    this.locationId,
    this.companyId,
    this.departmentId,
    this.equipmentCategoryId,
    this.manufacturerId,
    this.materialGroupId,
    this.equipmentStatusId,
    this.equipmentName,
    this.equipmentNumber,
    this.type,
    this.model,
    this.modelYear,
    this.vinnumber,
    this.attachToEquip,
    this.attachPostRevenue,
    this.fuelCostCode,
    this.fuelCostType,
    this.fuelCapacity,
    this.fuelCapUm,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.createdAt,
    this.updatedAt,
    this.equipmentCode,
    this.resourceId,
    this.location,
    this.company,
    this.department,
    this.equipmentCategory,
    this.manufacturer,
    this.materialGroup,
    this.purchaseDate,
    this.purchasePrice,
    this.equipmentStatus,
    this.equipmentTransfers,
    this.equipmentUsages,
    this.timeCardType,
  });

  int? id;
  String? moduleId;
  String? locationId;
  String? companyId;
  String? departmentId;
  String? equipmentCategoryId;
  String? manufacturerId;
  String? materialGroupId;
  String? equipmentStatusId;
  String? equipmentName;
  String? equipmentNumber;
  String? type;
  String? model;
  String? modelYear;
  String? vinnumber;
  String? attachToEquip;
  String? attachPostRevenue;
  dynamic fuelCostCode;
  dynamic fuelCostType;
  dynamic fuelCapacity;
  dynamic fuelCapUm;
  bool? isActive;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic deletedBy;
  String? createdAt;
  String? updatedAt;
  String? equipmentCode;
  dynamic resourceId;
  Location? location;
  Company? company;
  TagStatus? department;
  TagStatus? equipmentCategory;
  TagStatus? manufacturer;
  MaterialGroup? materialGroup;
  TagStatus? equipmentStatus;
  List<dynamic>? equipmentTransfers;
  List<dynamic>? equipmentUsages;
  TagStatus? timeCardType;
  String? purchaseDate;
  String? purchasePrice;

  factory Equipment.fromJson(Map<String, dynamic> json) => Equipment(
    id: json["id"],
   // moduleId: json["module_id"]??"",
    locationId: json["location_id"]??"",
    companyId: json["company_id"]??"",
    departmentId: json["department_id"]??"",
    equipmentCategoryId: json["equipment_category_id"]??"",
    manufacturerId: json["manufacturer_id"]??"",
    materialGroupId: json["material_group_id"]??"",
    equipmentStatusId: json["equipment_status_id"]??"",
    equipmentName: json["equipment_name"]??"",
    equipmentNumber: json["equipment_number"]??"",
    type: json["type"]??"",
    model: json["model"]??"",
    modelYear: json["model_year"]??"",
    vinnumber: json["vinnumber"]??"",
    attachToEquip: json["attach_to_equip"]??"",
    attachPostRevenue: json["attach_post_revenue"]??"",
    fuelCostCode: json["fuel_cost_code"]??"",
    fuelCostType: json["fuel_cost_type"]??"",
    fuelCapacity: json["fuel_capacity"]??"",
    fuelCapUm: json["fuel_cap_um"]??"",
    isActive: json["is_active"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    deletedBy: json["deleted_by"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    equipmentCode: json["equipment_code"],
    resourceId: json["resource_id"],
    purchaseDate: json["purchase_date"],
    purchasePrice: json["purchase_price"],
    location: json["location"]!=null?Location.fromJson(json["location"]):null,
    company: json["company"]!=null?Company.fromJson(json["company"]):null,
    department: json["department"]!=null?TagStatus.fromJson(json["department"]):null,
    equipmentCategory: json["equipment_category"]!=null?TagStatus.fromJson(json["equipment_category"]):null,
    manufacturer: json["manufacturer"]!=null?TagStatus.fromJson(json["manufacturer"]):null,
    materialGroup: json["material_group"]!=null?MaterialGroup.fromJson(json["material_group"]):null,
    equipmentStatus: json["equipment_status"]!=null?TagStatus.fromJson(json["equipment_status"]):null,
    equipmentTransfers: json["equipment_transfers"]!=null?List<dynamic>.from(json["equipment_transfers"].map((x) => x)):[],
    equipmentUsages:json["equipment_usages"]!=null? List<dynamic>.from(json["equipment_usages"].map((x) => x)):[],
    timeCardType:json["time_card_type"]!=null? TagStatus.fromJson(json["time_card_type"]):null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    //"module_id": moduleId,
    "location_id": locationId,
    "company_id": companyId,
    "department_id": departmentId,
    "equipment_category_id": equipmentCategoryId,
    "manufacturer_id": manufacturerId,
    "material_group_id": materialGroupId,
    "equipment_status_id": equipmentStatusId,
    "equipment_name": equipmentName,
    "equipment_number": equipmentNumber,
    "type": type,
    "model": model,
    "model_year": modelYear,
    "vinnumber": vinnumber,
    "attach_to_equip": attachToEquip,
    "attach_post_revenue": attachPostRevenue,
    "fuel_cost_code": fuelCostCode,
    "fuel_cost_type": fuelCostType,
    "fuel_capacity": fuelCapacity,
    "fuel_cap_um": fuelCapUm,
    "is_active": isActive,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "deleted_by": deletedBy,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "equipment_code": equipmentCode,
    "resource_id": resourceId,
    "purchase_date": purchaseDate,
    "purchase_price": purchasePrice,
    "location": location!.toJson(),
    "company": company!.toJson(),
    "department": department!.toJson(),
    "equipment_category": equipmentCategory!.toJson(),
    "manufacturer": manufacturer!.toJson(),
    "material_group": materialGroup!.toJson(),
    "equipment_status": equipmentStatus!.toJson(),
    "equipment_transfers": List<dynamic>.from(equipmentTransfers!.map((x) => x)),
    "equipment_usages": List<dynamic>.from(equipmentUsages!.map((x) => x)),
    "time_card_type": timeCardType?.toJson(),
  };
}

class Company {
  Company({
    this.id,
    this.name,
    this.logo,
    this.email,
    this.emailVerifiedAt,
    this.password,
    this.fein,
    this.officeFax,
    this.website,
    this.officePhone,
    this.isActive,
    this.companyStatusId,
    this.paymentMethodId,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.createdAt,
    this.updatedAt,
    this.tagQr,
  });

  int? id;
  String? name;
  dynamic logo;
  String? email;
  dynamic emailVerifiedAt;
  dynamic password;
  String? fein;
  String? officeFax;
  String? website;
  String? officePhone;
  bool? isActive;
  String? companyStatusId;
  String? paymentMethodId;
  String? createdBy;
  String? updatedBy;
  dynamic deletedBy;
  String? createdAt;
  String? updatedAt;
  TagQr? tagQr;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    id: json["id"],
    name: json["name"],
    logo: json["logo"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    password: json["password"],
    fein: json["fein"],
    officeFax: json["office_fax"],
    website: json["website"],
    officePhone: json["office_phone"],
    isActive: json["is_active"],
    companyStatusId: json["company_status_id"],
    paymentMethodId: json["payment_method_id"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    deletedBy: json["deleted_by"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    tagQr: json.containsKey("tag_qr")&&json["tag_qr"]!=null? TagQr.fromJson(json["tag_qr"]):TagQr(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "logo": logo,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "password": password,
    "fein": fein,
    "office_fax": officeFax,
    "website": website,
    "office_phone": officePhone,
    "is_active": isActive,
    "company_status_id": companyStatusId,
    "payment_method_id": paymentMethodId,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "deleted_by": deletedBy,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "tag_qr": tagQr!.toJson(),
  };
}

class TagQr {
  TagQr({
    this.viewUrl,
    this.url,
    this.download,
  });

  String? viewUrl;
  String? url;
  String ?download;

  factory TagQr.fromJson(Map<String, dynamic> json) => TagQr(
    viewUrl: json["view_url"],
    url: json["url"],
    download: json["download"],
  );

  Map<String, dynamic> toJson() => {
    "view_url": viewUrl,
    "url": url,
    "download": download,
  };
}

class TagStatus {
  TagStatus({
    this.id,
    this.companyId,
    this.name,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.createdAt,
    this.updatedAt,
    this.moduleId,
    this.detail,
    this.logo,
  });

  int? id;
  String? companyId;
  String? name;
  bool? isActive;
  String? createdBy;
  String? updatedBy;
  dynamic deletedBy;
  String? createdAt;
  String? updatedAt;
  String? moduleId;
  String? detail;
  dynamic logo;

  factory TagStatus.fromJson(Map<String, dynamic> json) => TagStatus(
    id: json["id"],
    companyId: json["company_id"] == null ? null : json["company_id"],
    name: json["name"],
    isActive: json["is_active"],
    createdBy: json["created_by"] == null ? null : json["created_by"],
    updatedBy: json["updated_by"] == null ? null : json["updated_by"],
    deletedBy: json["deleted_by"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    //moduleId: json["module_id"] == null ? null : json["module_id"],
    detail: json["detail"] == null ? null : json["detail"],
    logo: json["logo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "company_id": companyId == null ? null : companyId,
    "name": name,
    "is_active": isActive,
    "created_by": createdBy == null ? null : createdBy,
    "updated_by": updatedBy == null ? null : updatedBy,
    "deleted_by": deletedBy,
    "created_at": createdAt,
    "updated_at": updatedAt,
    //"module_id": moduleId == null ? null : moduleId,
    "detail": detail == null ? null : detail,
    "logo": logo,
  };
}

class Location {
  Location({
    this.id,
    this.companyId,
    this.moduleId,
    this.locationStatusId,
    this.name,
    this.taxCodeId,
    this.haulTaxOpt,
    this.costMethod,
    this.notes,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.createdAt,
    this.updatedAt,
    this.rack,
    this.shelf,
    this.physicalLocation,
    this.address,
  });

  int? id;
  String? companyId;
  String? moduleId;
  String? locationStatusId;
  String? name;
  dynamic taxCodeId;
  dynamic haulTaxOpt;
  dynamic costMethod;
  dynamic notes;
  bool? isActive;
  dynamic createdBy;
  String? updatedBy;
  dynamic deletedBy;
  String? createdAt;
  String? updatedAt;
  dynamic rack;
  dynamic shelf;
  dynamic physicalLocation;
  dynamic address;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    id: json["id"],
    companyId: json["company_id"],
    //moduleId: json["module_id"],
    locationStatusId: json["location_status_id"],
    name: json["name"],
    taxCodeId: json["tax_code_id"],
    haulTaxOpt: json["haul_tax_opt"],
    costMethod: json["cost_method"],
    notes: json["notes"],
    isActive: json["is_active"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    deletedBy: json["deleted_by"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    rack: json["rack"],
    shelf: json["shelf"],
    physicalLocation: json["physical_location"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "company_id": companyId,
   // "module_id": moduleId,
    "location_status_id": locationStatusId,
    "name": name,
    "tax_code_id": taxCodeId,
    "haul_tax_opt": haulTaxOpt,
    "cost_method": costMethod,
    "notes": notes,
    "is_active": isActive,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "deleted_by": deletedBy,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "rack": rack,
    "shelf": shelf,
    "physical_location": physicalLocation,
    "address": address,
  };
}

class MaterialGroup {
  MaterialGroup({
    this.id,
    this.moduleId,
    this.companyId,
    this.uuid,
    this.name,
    this.glacct,
    this.notes,
    this.description,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? moduleId;
  String? companyId;
  String? uuid;
  String? name;
  String? glacct;
  String? notes;
  String? description;
  bool? isActive;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic deletedBy;
  String? createdAt;
  String? updatedAt;

  factory MaterialGroup.fromJson(Map<String, dynamic> json) => MaterialGroup(
    id: json["id"],
    //moduleId: json["module_id"],
    companyId: json["company_id"],
    uuid: json["uuid"],
    name: json["name"],
    glacct: json["glacct"],
    notes: json["notes"],
    description: json["description"],
    isActive: json["is_active"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    deletedBy: json["deleted_by"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    //"module_id": moduleId,
    "company_id": companyId,
    "uuid": uuid,
    "name": name,
    "glacct": glacct,
    "notes": notes,
    "description": description,
    "is_active": isActive,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "deleted_by": deletedBy,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class Tag {
  Tag({
    this.id,
    this.tagTypeId,
    this.tagCategoryId,
    this.tagStatusId,
    this.tagName,
    this.tagUid,
    this.tagDescription,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.createdAt,
    this.updatedAt,
    this.companyId,
    this.tagType,
    this.tagCategory,
  });

  int? id;
  String? tagTypeId;
  String? tagCategoryId;
  String? tagStatusId;
  String? tagName;
  String? tagUid;
  String? tagDescription;
  bool? isActive;
  dynamic createdBy;
  String? updatedBy;
  dynamic deletedBy;
  String? createdAt;
  String? updatedAt;
  String? companyId;
  TagStatus? tagType;
  TagStatus? tagCategory;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
    id: json["id"],
    tagTypeId: json["tag_type_id"],
    tagCategoryId: json["tag_category_id"],
    tagStatusId: json["tag_status_id"],
    tagName: json["tag_name"],
    tagUid: json["tag_uid"],
    tagDescription: json["tag_description"],
    isActive: json["is_active"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    deletedBy: json["deleted_by"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    companyId: json["company_id"],
    tagType:json["tag_type"]!=null? TagStatus.fromJson(json["tag_type"]):null,
    tagCategory:json["tag_category"]!=null? TagStatus.fromJson(json["tag_category"]):null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tag_type_id": tagTypeId,
    "tag_category_id": tagCategoryId,
    "tag_status_id": tagStatusId,
    "tag_name": tagName,
    "tag_uid": tagUid,
    "tag_description": tagDescription,
    "is_active": isActive,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "deleted_by": deletedBy,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "company_id": companyId,
    "tag_type": tagType!.toJson(),
    "tag_category": tagCategory!.toJson(),
  };
}

class TagImage {
  TagImage({
    this.tagId,
    this.type,
    this.url,
    this.isDefault,
  });

  String? tagId;
  String? type;
  String? url;
  String ?isDefault;

  factory TagImage.fromJson(Map<String, dynamic> json) => TagImage(
    tagId: json["tag_id"],
    type: json["type"],
    url: json["url"],
    isDefault: json["is_default"],
  );

  Map<String, dynamic> toJson() => {
    "tag_id": tagId,
    "type": type,
    "url": url,
    "is_default": isDefault,
  };
}
