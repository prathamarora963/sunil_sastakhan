class ListResponse<TModel> {
  final bool? success;
  //final bool? status;
  final int? code;
  final String? message;
  final List<TModel>? body;

  ListResponse({
    this.success,
    //this.status,
    this.code,
    this.message,
    this.body,
  });

  factory ListResponse.fromJson(
      Map<String, dynamic> json, TModel Function(dynamic) fromJsonTModel) {
    List<dynamic> jsonBody = json['body'] ?? [];
    List<TModel> modelBody =
    jsonBody.map((e) => fromJsonTModel(e)).toList();
    return ListResponse<TModel>(
      success: json['success']?? json['status'] as bool?,
      //status: json['status'] as bool?,
      code: json['code'] as int?,
      message: json['message'] as String?,
      body: modelBody,
    );
  }

  Map<String, dynamic> toJson(
      dynamic Function(TModel) toJsonTModel) {
    final Map<String, dynamic> data = {};
    data['success'] = success;
    //data['status'] = status;
    data['code'] = code;
    data['message'] = message;
    data['body'] = body?.map((e) => toJsonTModel(e)).toList();
    return data;
  }
}
