class NotificationModel {
  dynamic id;
  dynamic userId;
  dynamic otherUserId;
  dynamic title;
  dynamic description;
  dynamic type;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  SenderDetails? senderDetails;
  SenderDetails? receiverDetails;

  NotificationModel(
      {this.id,
        this.userId,
        this.otherUserId,
        this.title,
        this.description,
        this.type,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.senderDetails,
        this.receiverDetails});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    otherUserId = json['other_user_id'];
    title = json['title'];
    description = json['description'];
    type = json['type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    senderDetails = json['senderDetails'] != null
        ? new SenderDetails.fromJson(json['senderDetails'])
        : null;
    receiverDetails = json['receiverDetails'] != null
        ? new SenderDetails.fromJson(json['receiverDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['other_user_id'] = this.otherUserId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['type'] = this.type;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    if (this.senderDetails != null) {
      data['senderDetails'] = this.senderDetails!.toJson();
    }
    if (this.receiverDetails != null) {
      data['receiverDetails'] = this.receiverDetails!.toJson();
    }
    return data;
  }
}

class SenderDetails {
  dynamic id;
  dynamic name;
  dynamic email;
  dynamic image;

  SenderDetails({this.id, this.name, this.email, this.image});

  SenderDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['image'] = this.image;
    return data;
  }
}
