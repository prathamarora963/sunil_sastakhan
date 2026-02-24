import 'package:get/get_rx/src/rx_types/rx_types.dart';

class PesticideRecommendationModel {
  dynamic id;
  dynamic suggestionId;
  dynamic title;
  String? month;
  dynamic pesticideId;
  dynamic totalCalculations;
  dynamic type;
  String? pesticideName;
  dynamic quantityPerSqm;
  dynamic variantId;
  dynamic nitrogen;
  dynamic lawnSize;
  dynamic phosphorus;
  dynamic cadmium;
  RxBool? checkBox = false.obs;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  List<PesticideVariant>? variants; // added variants

  PesticideRecommendationModel({
    this.id,
    this.suggestionId,
    this.month,
    this.title,
    this.totalCalculations,
    this.lawnSize,
    this.pesticideId,
    this.pesticideName,
    this.quantityPerSqm,
    this.type,
    this.nitrogen,
    this.phosphorus,
    this.cadmium,
    this.checkBox,
    this.variantId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.variants,
  });

  PesticideRecommendationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    variantId = json['varient_id'];
    suggestionId = json['suggestion_id'];
    type = json['type'];
    month = json['month'];
    totalCalculations = json['totalCalculations'];
    pesticideId = json['pesticide_id'];
    pesticideName = json['pesticide_name'];
    quantityPerSqm = json['quantity_per_sqm'];
    nitrogen = json['nitrogen'];
    phosphorus = json['phosphorus'];
    cadmium = json['cadmium'];
    createdAt = json['createdAt'];
    lawnSize = json['lawn_size'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    checkBox = false.obs;

    if (json['variants'] != null) {
      variants = [];
      json['variants'].forEach((v) {
        variants!.add(PesticideVariant.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['suggestion_id'] = suggestionId;
    data['month'] = month;
    data['lawn_size'] = lawnSize;
    data['pesticide_id'] = pesticideId;
    data['varient_id'] = variantId;
    data['title'] = title;
    data['pesticide_name'] = pesticideName;
    data['type'] = type;
    data['totalCalculations'] = totalCalculations;
    data['quantity_per_sqm'] = quantityPerSqm;
    data['nitrogen'] = nitrogen;
    data['phosphorus'] = phosphorus;
    data['cadmium'] = cadmium;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    if (variants != null) {
      data['variants'] = variants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PesticideVariant {
  dynamic id;
  dynamic productId;
  String? title;
  dynamic price;
  dynamic position;
  String? inventoryPolicy;
  dynamic compareAtPrice;
  String? option1;
  String? option2;
  String? option3;
  String? createdAt;
  String? updatedAt;
  bool? taxable;
  String? barcode;
  String? fulfillmentService;
  dynamic grams;
  String? inventoryManagement;
  bool? requiresShipping;
  String? sku;
  dynamic weight;
  String? weightUnit;
  dynamic inventoryItemId;

  PesticideVariant({
    this.id,
    this.productId,
    this.title,
    this.price,
    this.position,
    this.inventoryPolicy,
    this.compareAtPrice,
    this.option1,
    this.option2,
    this.option3,
    this.createdAt,
    this.updatedAt,
    this.taxable,
    this.barcode,
    this.fulfillmentService,
    this.grams,
    this.inventoryManagement,
    this.requiresShipping,
    this.sku,
    this.weight,
    this.weightUnit,
    this.inventoryItemId,
  });

  PesticideVariant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    title = json['title'];
    price = json['price'];
    position = json['position'];
    inventoryPolicy = json['inventory_policy'];
    compareAtPrice = json['compare_at_price'];
    option1 = json['option1'];
    option2 = json['option2'];
    option3 = json['option3'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    taxable = json['taxable'];
    barcode = json['barcode'];
    fulfillmentService = json['fulfillment_service'];
    grams = json['grams'];
    inventoryManagement = json['inventory_management'];
    requiresShipping = json['requires_shipping'];
    sku = json['sku'];
    weight = json['weight'];
    weightUnit = json['weight_unit'];
    inventoryItemId = json['inventory_item_id'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'title': title,
      'price': price,
      'position': position,
      'inventory_policy': inventoryPolicy,
      'compare_at_price': compareAtPrice,
      'option1': option1,
      'option2': option2,
      'option3': option3,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'taxable': taxable,
      'barcode': barcode,
      'fulfillment_service': fulfillmentService,
      'grams': grams,
      'inventory_management': inventoryManagement,
      'requires_shipping': requiresShipping,
      'sku': sku,
      'weight': weight,
      'weight_unit': weightUnit,
      'inventory_item_id': inventoryItemId,
    };
  }
}
