
class PaginationResponse<TModel> {
  final bool? success;
  final String? message;
  final String? countTotalRecord;
  final List<TModel>? data;

  PaginationResponse({
    this.success,
    this.countTotalRecord,
    this.message,
    this.data,
  });

  factory PaginationResponse.fromJson(
      Map<String, dynamic> json, TModel Function(dynamic) fromJsonTModel) {
    List<dynamic> jsonBody = json['data'] ?? json['body']??[];
    List<TModel> modelBody =
    jsonBody.map((e) => fromJsonTModel(e)).toList();
    final parsedTotal = _parseTotalCount(
      json['countTotalRecord'],
      json['totalItems'],
    );
    return PaginationResponse<TModel>(
      success: json['status'] as bool?,
      countTotalRecord: parsedTotal,
      message: json['message'] as String?,
      data: modelBody,
    );
  }

  static String? _parseTotalCount(dynamic countTotalRecord, dynamic totalItems) {
    final directCount = _asTrimmedString(countTotalRecord);
    if (directCount != null && directCount.isNotEmpty) {
      return directCount;
    }

    final fallbackCount = _asTrimmedString(totalItems);
    if (fallbackCount != null && fallbackCount.isNotEmpty) {
      return fallbackCount;
    }
    return null;
  }

  static String? _asTrimmedString(dynamic value) {
    if (value == null) return null;
    final text = value.toString().trim();
    return text.isEmpty ? null : text;
  }
}
