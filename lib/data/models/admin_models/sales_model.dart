class SalesModel {
    SalesModel({
        required this.todaySale,
    });

    final num? todaySale;

    factory SalesModel.fromJson(Map<String, dynamic> json){ 
        return SalesModel(
            todaySale: json["today_sale"],
        );
    }

}
