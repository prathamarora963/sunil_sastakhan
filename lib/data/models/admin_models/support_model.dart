class SupportModel {
    SupportModel({
        required this.id,
        required this.userId,
        required this.agent,
        required this.message,
        required this.subject,
        required this.file,
        required this.status,
        required this.createdAt,
        required this.fName,
        required this.image,
        required this.email,
        required this.mobile,
    });

    final String? id;
    final String? userId;
    final String? agent;
    final String? message;
    final String? subject;
    final String? file;
    final String? status;
    final DateTime? createdAt;
    final String? fName;
    final String? image;
    final String? email;
    final String? mobile;

    factory SupportModel.fromJson(Map<String, dynamic> json){ 
        return SupportModel(
            id: json["id"],
            userId: json["user_id"],
            agent: json["agent"],
            message: json["message"],
            subject: json["subject"],
            file: json["file"],
            status: json["status"],
            createdAt: DateTime.tryParse(json["created_at"] ?? ""),
            fName: json["f_name"],
            image: json["image"],
            email: json["email"],
            mobile: json["mobile"],
        );
    }

}

class SupportRequest {
  final String agent;
  final int pageNo;

  const SupportRequest({this.agent = "", this.pageNo = 1});

  Map<String, dynamic> toJson() {
    return {"agent": agent, "pageNo": pageNo.toString()};
  }
}