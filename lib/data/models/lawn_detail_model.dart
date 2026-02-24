class LawnDetailModel {
  dynamic id;
  dynamic questionEn;
  dynamic questionDe;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  int? selectIndex = -1;
  List<Answers>? answers;

  LawnDetailModel({
    this.id,
    this.questionEn,
    this.questionDe,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.answers,
  });

  LawnDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionEn = json['question_en'];
    questionDe = json['question_de'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers!.add(new Answers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question_en'] = this.questionEn;
    data['question_de'] = this.questionDe;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    if (this.answers != null) {
      data['answers'] = this.answers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Answers {
  dynamic id;
  dynamic questionnaireId;
  dynamic answerEn;
  dynamic answerDe;
  dynamic persentage;
  dynamic createdAt;
  dynamic updatedAt;
  int? selectIndex = -1;
  dynamic deletedAt;

  Answers({
    this.id,
    this.questionnaireId,
    this.answerEn,
    this.answerDe,
    this.persentage,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  Answers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionnaireId = json['questionnaire_id'];
    answerEn = json['answer_en'];
    answerDe = json['answer_de'];
    persentage = json['persentage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['questionnaire_id'] = this.questionnaireId;
    data['answer_en'] = this.answerEn;
    data['answer_de'] = this.answerDe;
    data['persentage'] = this.persentage;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    return data;
  }
}
