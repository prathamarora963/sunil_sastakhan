class PesticidesDiaryModel {
  Summary? summary;
  QuantitySummary? quantitySummary;
  List<Details>? details;

  PesticidesDiaryModel({this.summary, this.quantitySummary, this.details});

  PesticidesDiaryModel.fromJson(Map<String, dynamic> json) {
    summary =
    json['summary'] != null ? new Summary.fromJson(json['summary']) : null;
    quantitySummary = json['quantity_summary'] != null
        ? new QuantitySummary.fromJson(json['quantity_summary'])
        : null;
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details!.add(new Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.summary != null) {
      data['summary'] = this.summary!.toJson();
    }
    if (this.quantitySummary != null) {
      data['quantity_summary'] = this.quantitySummary!.toJson();
    }
    if (this.details != null) {
      data['details'] = this.details!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Summary {
  Total? total;
  Total? used;
  Total? remaining;

  Summary({this.total, this.used, this.remaining});

  Summary.fromJson(Map<String, dynamic> json) {
    total = json['total'] != null ? new Total.fromJson(json['total']) : null;
    used = json['used'] != null ? new Total.fromJson(json['used']) : null;
    remaining = json['remaining'] != null
        ? new Total.fromJson(json['remaining'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.total != null) {
      data['total'] = this.total!.toJson();
    }
    if (this.used != null) {
      data['used'] = this.used!.toJson();
    }
    if (this.remaining != null) {
      data['remaining'] = this.remaining!.toJson();
    }
    return data;
  }
}

class Total {
  dynamic nitrogen;
  dynamic phosphorus;
  dynamic cadmium;

  Total({this.nitrogen, this.phosphorus, this.cadmium});

  Total.fromJson(Map<String, dynamic> json) {
    nitrogen = json['nitrogen'];
    phosphorus = json['phosphorus'];
    cadmium = json['cadmium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nitrogen'] = this.nitrogen;
    data['phosphorus'] = this.phosphorus;
    data['cadmium'] = this.cadmium;
    return data;
  }
}

class QuantitySummary {
  dynamic totalQuantity;
  dynamic usedQuantity;
  dynamic remainingQuantity;

  QuantitySummary(
      {this.totalQuantity, this.usedQuantity, this.remainingQuantity});

  QuantitySummary.fromJson(Map<String, dynamic> json) {
    totalQuantity = json['total_quantity'];
    usedQuantity = json['used_quantity'];
    remainingQuantity = json['remaining_quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_quantity'] = this.totalQuantity;
    data['used_quantity'] = this.usedQuantity;
    data['remaining_quantity'] = this.remainingQuantity;
    return data;
  }
}

class Details {
  dynamic month;
  dynamic id;
  dynamic pesticideName;
  dynamic quantityPerSqm;
  dynamic requiredQuantity;
  dynamic nitrogen;
  dynamic phosphorus;
  dynamic cadmium;
  dynamic status;
  dynamic isApplied;

  Details(
      {this.month,
        this.pesticideName,
        this.id,
        this.quantityPerSqm,
        this.requiredQuantity,
        this.nitrogen,
        this.isApplied,
        this.phosphorus,
        this.cadmium,
        this.status});

  Details.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    id = json['id'];
    pesticideName = json['pesticide_name'];
    isApplied = json['is_applied'];
    quantityPerSqm = json['quantity_per_sqm'];
    requiredQuantity = json['required_quantity'];
    nitrogen = json['nitrogen'];
    phosphorus = json['phosphorus'];
    cadmium = json['cadmium'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['month'] = this.month;
    data['id'] = this.id;
    data['pesticide_name'] = this.pesticideName;
    data['quantity_per_sqm'] = this.quantityPerSqm;
    data['required_quantity'] = this.requiredQuantity;
    data['nitrogen'] = this.nitrogen;
    data['phosphorus'] = this.phosphorus;
    data['is_applied'] = this.isApplied;
    data['cadmium'] = this.cadmium;
    data['status'] = this.status;
    return data;
  }
}
