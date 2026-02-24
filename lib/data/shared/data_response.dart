class DataResponse<TModel> {
  bool? success;
  //int? status;
  String? message;
  TModel? body;
  int? code;

  DataResponse({this.success, this.message, this.body, this.code});

  factory DataResponse.fromJson(Map<String, dynamic> json, TModel Function(dynamic json) fromJsonT) {
    return DataResponse<TModel>(
      success: json['success'] as bool?,
      //status: json['status'] as int?,
      message: json['message'] as String?,
      body: fromJsonT(json['body']),
      code: json['code'] as int?,
    );
  }

  Map<String, dynamic> toJson(dynamic Function(TModel? value) toJsonT) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    //data['status'] = status;
    data['message'] = message;
    data['body'] = toJsonT(body);
    data['code'] = code;
    return data;
  }
}