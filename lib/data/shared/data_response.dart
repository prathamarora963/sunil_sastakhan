class DataResponse<TModel> {
  bool? success;
  //int? status;
  String? message;
  TModel? body;
  int? code;
  String? token;

  DataResponse({this.success, this.message, this.body, this.code,this.token});

  factory DataResponse.fromJson(Map<String, dynamic> json, TModel Function(dynamic json) fromJsonT) {
    return DataResponse<TModel>(
      success: json['success'] ?? json['status'] as bool,
      //status: json['status'] as int?,
      message: json['message'] as String?,
      body: fromJsonT(json),
      code: json['code'] as int?,
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson(dynamic Function(TModel? value) toJsonT) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    //data['status'] = status;
    data['message'] = message;
    data['body'] = toJsonT(body);
    data['code'] = code;
    data['token'] = token;
    return data;
  }
}