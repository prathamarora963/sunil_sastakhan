class MyLawnDetailModel {
  dynamic id;
  dynamic userId;
  dynamic questionId;
  dynamic answerId;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  Question? question;
  Answer? answer;

  MyLawnDetailModel(
      {this.id,
        this.userId,
        this.questionId,
        this.answerId,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.question,
        this.answer});

  MyLawnDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    questionId = json['question_id'];
    answerId = json['answer_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    question = json['question'] != null
        ? new Question.fromJson(json['question'])
        : null;
    answer =
    json['answer'] != null ? new Answer.fromJson(json['answer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['question_id'] = this.questionId;
    data['answer_id'] = this.answerId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    if (this.question != null) {
      data['question'] = this.question!.toJson();
    }
    if (this.answer != null) {
      data['answer'] = this.answer!.toJson();
    }
    return data;
  }
}

class Question {
  dynamic id;
  dynamic questionEn;
  dynamic questionDe;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  Question(
      {this.id,
        this.questionEn,
        this.questionDe,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionEn = json['question_en'];
    questionDe = json['question_de'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question_en'] = this.questionEn;
    data['question_de'] = this.questionDe;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    return data;
  }
}

class Answer {
  dynamic id;
  dynamic questionnaireId;
  dynamic answerEn;
  dynamic answerDe;
  dynamic persentage;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  Answer(
      {this.id,
        this.questionnaireId,
        this.answerEn,
        this.answerDe,
        this.persentage,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Answer.fromJson(Map<String, dynamic> json) {
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
