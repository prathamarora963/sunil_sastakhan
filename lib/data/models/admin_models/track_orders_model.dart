class TrackOrdersModel {
  TrackOrdersModel({
    required this.id,
    required this.userId,
    required this.merchantId,
    required this.uniqueOrderId,
    required this.orderStatus,
    required this.payment,
    required this.paymentMode,
    required this.discountAmount,
    required this.deliveryFee,
    required this.gstCharges,
    required this.orderDate,
    required this.transactionId,
    required this.transactionStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.customerName,
    required this.image,
    required this.items,
  });

  final String? id;
  final String? userId;
  final String? merchantId;
  final String? uniqueOrderId;
  final String? orderStatus;
  final String? payment;
  final String? paymentMode;
  final String? discountAmount;
  final String? deliveryFee;
  final String? gstCharges;
  final DateTime? orderDate;
  final String? transactionId;
  final String? transactionStatus;
  final DateTime? createdAt;
  final dynamic updatedAt;
  final String? customerName;
  final String? image;
  final List<Item> items;

  factory TrackOrdersModel.fromJson(Map<String, dynamic> json) {
    return TrackOrdersModel(
      id: json["id"],
      userId: json["user_id"],
      merchantId: json["merchant_id"],
      uniqueOrderId: json["unique_order_id"],
      orderStatus: json["order_status"],
      payment: json["payment"],
      paymentMode: json["payment_mode"],
      discountAmount: json["discount_amount"],
      deliveryFee: json["delivery_fee"],
      gstCharges: json["gst_charges"],
      orderDate: DateTime.tryParse(json["order_date"] ?? ""),
      transactionId: json["transaction_id"],
      transactionStatus: json["transaction_status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: json["updated_at"],
      customerName: json["customer_name"],
      image: json["image"],
      items: json["items"] == null
          ? []
          : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
    );
  }
}

class Item {
  Item({
    required this.id,
    required this.userOrderDetailsId,
    required this.itemsId,
    required this.itemsName,
    required this.qty,
    required this.price,
    required this.offerPrice,
    required this.itemsDescription,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? id;
  final String? userOrderDetailsId;
  final String? itemsId;
  final String? itemsName;
  final String? qty;
  final String? price;
  final String? offerPrice;
  final String? itemsDescription;
  final DateTime? createdAt;
  final dynamic updatedAt;

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json["id"],
      userOrderDetailsId: json["user_order_details_id"],
      itemsId: json["items_id"],
      itemsName: json["items_name"],
      qty: json["qty"],
      price: json["price"],
      offerPrice: json["offer_price"],
      itemsDescription: json["items_description"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: json["updated_at"],
    );
  }
}

class AdminTrackOrdersRequest {
  final String orderStatus;
  final int pageNo;
  final String? userId;

  const AdminTrackOrdersRequest({
    this.orderStatus = "",
    this.pageNo = 1,
    this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      "order_status": orderStatus,
      "pageNo": pageNo.toString(),
      if (userId != null) "user_id": userId,
    };
  }
}
